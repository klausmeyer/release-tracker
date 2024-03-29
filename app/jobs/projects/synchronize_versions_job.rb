module Projects
  class SynchronizeVersionsJob < ApplicationJob
    def perform(project, full_sync = false)
      self.full_sync = full_sync

      client.tags(project.slug).each do |tag|
        match = tag[:name].match(project.version_pattern_regexp)

        Rails.logger.debug "[#{self.class.name}] #{project.slug} :: #{tag[:name]} :: #{match}"

        next if match.nil?

        version = project.versions.find_or_initialize_by(match.named_captures)
        version.git_tag = tag[:name]
        version.git_sha = tag[:commit][:sha]

        next unless version.changed?

        version.save!

        Versions::UpdateReleaseDateJob.perform_later(version)
        Versions::NotifyJob.perform_later(version) unless full_sync
      end

      SynchronizeVersionsJob.set(wait_until: 1.hour.from_now).perform_later(project, false)
    end

    private

    attr_accessor :full_sync

    def client
      @client ||= Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"], auto_paginate: full_sync)
    end
  end
end

module Projects
  class SynchronizeVersionsJob < ApplicationJob
    def perform(project, full_sync)
      self.full_sync = full_sync

      client.tags(project.slug).each do |tag|
        match = tag[:name].match(project.version_pattern_regex)

        Rails.logger.debug "[#{self.class.name}] #{project.slug} :: #{tag[:name]} :: #{match}"

        next if match.nil?

        version = project.versions.find_or_initialize_by(match.named_captures)
        version.git_tag = tag[:name]
        version.git_sha = tag[:commit][:sha]

        version.save!

        if version.changed?
          Versions::UpdateReleaseDateJob.perform_later(version)
          Versions::NotifyJob.perform_later(version)
        end
      end
    end

    private

    attr_accessor :full_sync

    def client
      @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'], auto_paginate: full_sync)
    end
  end
end

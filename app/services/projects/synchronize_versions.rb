module Projects
  class SynchronizeVersions
    def initialize(project, full_sync: false)
      self.project   = project
      self.full_sync = full_sync
    end

    def call
      client.tags(project.slug).pluck(:name).each do |tag|
        match = tag.match(project.version_pattern_regex)

        Rails.logger.debug "#{project.slug} :: #{tag} :: #{match}"

        next if match.nil?

        project.versions.find_or_create_by!(match.named_captures)
      end
    end

    private

    attr_accessor :project, :full_sync

    def client
      @client ||= Octokit::Client.new(auto_paginate: full_sync)
    end
  end
end

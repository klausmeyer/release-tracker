module Versions
  class UpdateReleaseDate
    def initialize(version, full_sync: false)
      self.version   = version
      self.full_sync = full_sync
    end

    def call
      release = client.release_for_tag(version.project.slug, version.git_tag)
      date    = release[:published_at] || release[:created_at]

      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: #{date}"

      version.update! released_at: date
    rescue Octokit::NotFound
      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: Not found"
    end

    private

    attr_accessor :version, :full_sync

    def client
      @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'], auto_paginate: full_sync)
    end
  end
end

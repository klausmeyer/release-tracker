module Versions
  class UpdateReleaseDateJob < ApplicationJob
    def perform(version)
      release = client.release_for_tag(version.project.slug, version.git_tag)
      date    = release[:published_at] || release[:created_at]

      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: #{date}"

      version.update! released_at: date
    rescue Octokit::NotFound
      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: Not found"
    end

    private

    def client
      @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end
  end
end

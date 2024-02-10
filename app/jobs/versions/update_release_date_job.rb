module Versions
  class UpdateReleaseDateJob < ApplicationJob
    def perform(version)
      self.version = version

      timestamp = try_with_release || try_with_commit

      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: #{timestamp}"

      version.update! released_at: timestamp
    end

    private

    attr_accessor :version

    def try_with_release
      return if release.nil?

      release[:published_at] || release[:created_at]
    end

    def try_with_commit
      return if commit.nil?

      commit.dig(:commit, :committer, :date) || commit.dig(:commit, :author, :date)
    end

    def release
      @release ||= client.release_for_tag(version.project.slug, version.git_tag)
    rescue Octokit::NotFound
      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_tag} :: Not found"

      nil
    end

    def commit
      @commit ||= client.commit(version.project.slug, version.git_sha)
    rescue Octokit::NotFound
      Rails.logger.debug "[#{self.class.name}] #{version.project.slug} :: #{version.git_sha} :: Not found"

      nil
    end

    def client
      @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end
  end
end

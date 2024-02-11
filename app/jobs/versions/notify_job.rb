module Versions
  class NotifyJob < ApplicationJob
    def perform(version)
      self.version = version

      client.post(nil, body.to_json)
    end

    private

    attr_accessor :version

    def client
      @client ||= Faraday.new(url: url) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.response :raise_error
        faraday.response :logger unless Rails.env.test?
      end
    end

    def url
      ENV.fetch("WEBHOOK_DISCORD_URL")
    end

    def body
      {
        embeds: [{
          title: "#{version.project.name} - #{version}",
          url:   version.project.link
        }]
      }
    end
  end
end

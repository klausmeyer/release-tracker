require "rails_helper"

RSpec.describe "GET /feeds/atom" do
  include ActiveSupport::Testing::TimeHelpers

  let!(:version) { FactoryBot.create(:version) }

  it "returns a feed of latest versions in atom+xml format" do
    freeze_time do
      get "/feeds/atom"

      expect(response.body).to eq <<~XML
        <?xml version="1.0" encoding="UTF-8"?>
        <feed xmlns="http://www.w3.org/2005/Atom"
          xmlns:dc="http://purl.org/dc/elements/1.1/">
          <author>
            <name>Release Tracker</name>
          </author>
          <id>http://www.example.com/feeds/atom</id>
          <title>Latest Versions</title>
          <updated>#{Time.now.w3cdtf}</updated>
          <entry>
            <id>http://www.example.com/projects/#{version.project.source}/#{version.project.slug}#version-#{version}</id>
            <link href="http://www.example.com/projects/#{version.project.source}/#{version.project.slug}#version-#{version}"/>
            <title>#{version.project.name} #{version} was released</title>
            <updated>#{version.released_at.to_time.w3cdtf}</updated>
            <dc:date>#{version.released_at.to_time.w3cdtf}</dc:date>
          </entry>
          <dc:date>#{Time.now.w3cdtf}</dc:date>
        </feed>
      XML
    end
  end
end

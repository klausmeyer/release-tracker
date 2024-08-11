require "rails_helper"

RSpec.describe Versions::NotifyJob do
  let(:instance) { described_class.new }

  describe "#perform" do
    let(:version) { FactoryBot.create(:version) }

    let!(:discord_request) do
      stub_request(:post, "https://discord.com/api/webhooks/dummy")
    end

    it "sends a webhook to a configured discord url" do
      instance.perform(version)

      expect(discord_request.with do |req|
        expect(req.headers["Content-Type"]).to eq "application/json"
        expect(req.body).to eq({
          embeds: [ {
            title: "#{version.project.name} - #{version}",
            url:   version.project.link
          } ]
        }.to_json)
      end).to have_been_made
    end
  end
end

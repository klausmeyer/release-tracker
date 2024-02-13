require "rails_helper"

RSpec.describe Projects::SynchronizeVersionsJob do
  include ActiveJob::TestHelper
  include ActiveSupport::Testing::TimeHelpers

  let(:instance) { described_class.new }

  describe "#perform" do
    let(:project) { FactoryBot.create(:project) }
    let(:octokit) { instance_double(Octokit::Client) }

    let(:tags) { [tag1, tag2, tag3, tag4] }

    let(:tag1) { {name: "1.2.3",      commit: {sha: "674d7f843a1999707e27eb4e876e3995316f4277"}} }
    let(:tag2) { {name: "v1.2.4",     commit: {sha: "75d4e6f9b9e01ebf50a8aaec67deea2d89b496e8"}} }
    let(:tag3) { {name: "v1.3.0-rc1", commit: {sha: "8b7d46d21efb4a28fdff05310448b91e5d2677fd"}} }
    let(:tag4) { {name: "testing",    commit: {sha: "bda7f5b0bcbead9b999aecce1deb4fbd493a880c"}} }

    before do
      allow(Octokit::Client).to receive(:new).and_return(octokit)
      allow(octokit).to receive(:tags).with(project.slug).and_return(tags)
    end

    it "creates version records for all qualifying tags" do
      instance.perform(project)

      expect(project.versions.count).to eq 2
      expect(project.versions.where(
        major:   1,
        minor:   2,
        patch:   3,
        git_tag: tag1[:name],
        git_sha: tag1[:commit][:sha]
      )).to exist
      expect(project.versions.where(
        major:   1,
        minor:   2,
        patch:   4,
        git_tag: tag2[:name],
        git_sha: tag2[:commit][:sha]
      )).to exist
    end

    it "enqueues follow-up jobs" do
      instance.perform(project)

      expect(Versions::UpdateReleaseDateJob).to have_been_enqueued.with(Version).twice
      expect(Versions::NotifyJob).to have_been_enqueued.with(Version).twice
    end

    it "schedules the same job again at a later time" do
      freeze_time do
        instance.perform(project)

        expect(described_class).to have_been_enqueued.with(project, false).at(1.hour.from_now)
      end
    end
  end
end

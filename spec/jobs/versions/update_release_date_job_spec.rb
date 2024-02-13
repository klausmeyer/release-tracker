require "rails_helper"

RSpec.describe Versions::UpdateReleaseDateJob do
  let(:instance) { described_class.new }

  describe "#perform" do
    let(:version) { FactoryBot.create(:version, released_at: nil) }

    let(:octokit) { instance_double(Octokit::Client) }

    before do
      allow(Octokit::Client).to receive(:new).and_return(octokit)
    end

    context "when the github api returns infos for a release" do
      let(:release) { instance_double(Sawyer::Resource) }
      let(:published_at) { "2013-02-27T19:35:32Z" }

      before do
        allow(octokit).to receive(:release_for_tag).with(version.project.slug, version.git_tag).and_return(release)
        allow(release).to receive(:[]).with(:published_at).and_return(published_at)
      end

      it "updates the records released_at with the infoss from it" do
        expect { instance.perform(version) }.to change(version, :released_at).from(nil).to(DateTime.parse(published_at))
      end
    end

    context "when the github api does not have a release" do
      before do
        allow(octokit).to receive(:release_for_tag).and_raise(Octokit::NotFound)
      end

      context "when it has infos about the commit" do
        let(:commit) { instance_double(Sawyer::Resource) }
        let(:commit_date) { "2014-02-27T19:35:32Z" }

        before do
          allow(octokit).to receive(:commit).with(version.project.slug, version.git_sha).and_return(commit)
          allow(commit).to receive(:dig).with(:commit, :committer, :date).and_return(commit_date)
        end

        it "uses the date information from it" do
          expect { instance.perform(version) }.to change(version, :released_at).from(nil).to(DateTime.parse(commit_date))
        end
      end

      context "when it also does not know the commit" do
        before do
          allow(octokit).to receive(:commit).and_raise(Octokit::NotFound)
        end

        it "keeps the attribute set to nil" do
          instance.perform(version)

          expect(version.reload.released_at).to be nil
        end
      end
    end
  end
end

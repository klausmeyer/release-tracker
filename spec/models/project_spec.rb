require "rails_helper"

RSpec.describe Project do
  let(:project) { FactoryBot.create(:project) }

  describe "#latest_version" do
    before do
      FactoryBot.create(:version, project: project, major: 1, minor: 7, patch: 0)
      FactoryBot.create(:version, project: project, major: 1, minor: 7, patch: 1)
      FactoryBot.create(:version, project: project, major: 1, minor: 6, patch: 6)
    end

    it "returns the latest stable version by semver" do
      expect(project.latest_version.to_s).to eq "1.7.1"
    end
  end

  describe "#link" do
    it "returns a github.com link to the project" do
      expect(project.link).to eq "https://github.com/#{project.slug}"
    end
  end

  describe "#version_pattern_regexp" do
    it "returns a regexp object based on the configured pattern" do
      expect(project.version_pattern_regexp).to be_a Regexp
      expect(project.version_pattern_regexp).to eq(/^(?:v|release-)?(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$/)
    end
  end
end

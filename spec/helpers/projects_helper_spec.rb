require "rails_helper"

RSpec.describe ProjectsHelper do
  describe "#project_path" do
    let(:project) { FactoryBot.create(:project) }

    it "returns the path to the projects show page" do
      expect(helper.project_path(project)).to eq "/projects/#{project.source}/#{project.slug}"
    end
  end
end

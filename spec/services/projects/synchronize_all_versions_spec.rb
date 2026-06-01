require "rails_helper"

require "rails_helper"

RSpec.describe Projects::SynchronizeAllVersions do
  let!(:projects) { FactoryBot.create_list(:project, 3) }

  describe "#call" do
    it "schedules one job per project" do
      described_class.call

      expect(Projects::SynchronizeVersionsJob).to have_been_enqueued.once.with(projects[0], false)
      expect(Projects::SynchronizeVersionsJob).to have_been_enqueued.once.with(projects[1], false)
      expect(Projects::SynchronizeVersionsJob).to have_been_enqueued.once.with(projects[2], false)
    end
  end
end

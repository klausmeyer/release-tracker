require "rails_helper"

RSpec.describe Version do
  describe "scopes" do
    describe "semantic" do
      before do
        FactoryBot.create(:version, major: 7, minor: 1, patch: 2)
        FactoryBot.create(:version, major: 7, minor: 1, patch: 3)
        FactoryBot.create(:version, major: 7, minor: 1, patch: 3, pre: 1)
        FactoryBot.create(:version, major: 7, minor: 1, patch: 3, pre: 2)
        FactoryBot.create(:version, major: 7, minor: 1, patch: 4)
      end

      let(:versions) { Version.semantic.map(&:to_s) }

      it "returns versions ordered by semantic rules" do
        expect(versions).to eq %w[
          7.1.2
          7.1.3
          7.1.3.1
          7.1.3.2
          7.1.4
        ]
      end
    end
  end
end

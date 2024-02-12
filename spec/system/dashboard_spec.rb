require "rails_helper"

RSpec.describe "Dashboard" do
  let!(:projects) { FactoryBot.create_list(:project, 3) }

  scenario "Listing the available projects" do
    visit root_path

    expect(page).to have_text "Latest releases"
    expect(page).to have_text "Popular projects"

    expect(page).to have_text projects.first.name
    expect(page).to have_text projects.last.name
  end
end

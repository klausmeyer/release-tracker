require "rails_helper"

RSpec.describe "Projects" do
  include ProjectsHelper

  let!(:projects) { FactoryBot.create_list(:project, 3) }

  scenario "Listing the available projects" do
    visit projects_path

    expect(page).to have_text "Projects"

    expect(page).to have_text projects.first.name
    expect(page).to have_text projects.last.name
  end

  scenario "Showing details of a project" do
    visit project_path(projects.second)

    expect(page).to have_text "Project"

    expect(page).to have_text projects.second.name

    expect(page).to have_text "Versions"
  end
end

require "rails_helper"

RSpec.describe "routes for projects" do
  it 'routes GET "projects/:source/:slug" to projects#show' do
    expect(get("projects/github/rails/rails")).to route_to(
      controller: "projects",
      action:     "show",
      source:     "github",
      slug:       "rails/rails"
    )
  end
end

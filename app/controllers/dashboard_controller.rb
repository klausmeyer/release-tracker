class DashboardController < ApplicationController
  def index
    @projects = Project.popular.limit(10)
    @versions = Version.latest.limit(10).includes(:project)
  end
end

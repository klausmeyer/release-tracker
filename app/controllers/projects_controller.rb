class ProjectsController < ApplicationController
  def index
    @projects = Project.alphabetical.all
  end

  def show
    @project = Project.find_by!(source: params[:source], slug: params[:slug])
  end
end

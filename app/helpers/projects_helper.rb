module ProjectsHelper
  def project_path(project)
    "/projects/#{project.source}/#{project.slug}"
  end
end

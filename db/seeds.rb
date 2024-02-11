# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

VersionPattern.find_or_create_by!(name: "Default") do |vp|
  vp.examples = "1.2.3 / v1.2.3 / release-1.2.3"
  vp.regexp   = '^(?:v|release-)?(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)$'
end

VersionPattern.find_or_create_by!(name: "PostgreSQL") do |vp|
  vp.examples = "REL_1_2"
  vp.regexp   = '^REL_(?<major>\d+)_(?<minor>\d+)$'
end

VersionPattern.find_or_create_by!(name: "Ruby") do |vp|
  vp.examples = "v1_2_3"
  vp.regexp   = '^v(?<major>\d+)_(?<minor>\d+)_(?<patch>\d+)$'
end

[
  {source: "github", slug: "derailed/k9s",          name: "k9s"},
  {source: "github", slug: "keycloak/keycloak",     name: "Keycloak"},
  {source: "github", slug: "kubernetes/kubernetes", name: "Kubernetes"},
  {source: "github", slug: "longhorn/longhorn",     name: "Longhorn"},
  {source: "github", slug: "microsoft/vscode",      name: "Visual Studio Code"},
  {source: "github", slug: "moby/moby",             name: "Docker"},
  {source: "github", slug: "nginx/nginx",           name: "Nginx"},
  {source: "github", slug: "postgres/postgres",     name: "PostgreSQL"},
  {source: "github", slug: "rails/rails",           name: "Ruby on Rails"},
  {source: "github", slug: "ruby/ruby",             name: "Ruby"}
].each do |project|
  Project.find_or_create_by!(source: project[:source], slug: project[:slug]) do |p|
    p.assign_attributes(project)
    p.version_pattern = VersionPattern.find_by(name: p[:name]) || VersionPattern.find_by(name: "Default")
  end
end

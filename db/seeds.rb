# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  {source: 'github', slug: 'derailed/k9s',          name: 'k9s'},
  {source: 'github', slug: 'keycloak/keycloak',     name: 'Keycloak'},
  {source: 'github', slug: 'kubernetes/kubernetes', name: 'Kubernetes'},
  {source: 'github', slug: 'longhorn/longhorn',     name: 'Longhorn'},
  {source: 'github', slug: 'moby/moby',             name: 'Docker'},
  {source: 'github', slug: 'nginx/nginx',           name: 'Nginx'},
  {source: 'github', slug: 'postgres/postgres',     name: 'PostgreSQL', version_pattern: '^REL_(?<major>\d+)_(?<minor>\d+)$'},
  {source: 'github', slug: 'rails/rails',           name: 'Ruby on Rails'},
  {source: 'github', slug: 'rubyruby',              name: 'Ruby', version_pattern: '^v(?<major>\d+)_(?<minor>\d+)_(?<patch>\d+)$'},
].each do |project|
  Project.find_or_create_by!(source: project[:source], slug: project[:slug]) { |p| p.assign_attributes(project) }
end

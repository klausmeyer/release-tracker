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
  {source: 'github', slug: 'kubernetes/kubernetes', name: 'Kubernetes'},
  {source: 'github', slug: 'rails/rails',           name: 'Ruby on Rails'},
  {source: 'github', slug: 'longhorn/longhorn',     name: 'Longhorn'},
  {source: 'github', slug: 'nginx/nginx',           name: 'Nginx'},
  {source: 'github', slug: 'keycloak/keycloak',     name: 'Keycloak'},
  {source: 'github', slug: 'postgres/postgres',     name: 'PostgreSQL', version_pattern: '^REL_(?<major>\d+)_(?<minor>\d+)$'},
].each do |project|
  Project.find_or_create_by!(source: project[:source], slug: project[:slug]) { |p| p.assign_attributes(project) }
end

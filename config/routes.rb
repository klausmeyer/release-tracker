require "sidekiq/web"

Rails.application.routes.draw do
  root to: "dashboard#index"

  get "/projects", to: "projects#index", as: :projects
  get "/projects/:source/:slug", to: "projects#show", constraints: {source: /[^\/]+/, slug: /[^\/]+\/[^\/]+/}, as: :project

  get "/feeds/atom", to: "feeds#atom", defaults: {format: :xml}, as: :atom_feed

  mount Sidekiq::Web, at: "/sidekiq"
end

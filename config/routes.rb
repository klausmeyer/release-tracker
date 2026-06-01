Rails.application.routes.draw do
  root to: "dashboard#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/projects", to: "projects#index", as: :projects
  get "/projects/:source/:slug", to: "projects#show", constraints: { source: /[^\/]+/, slug: /[^\/]+\/[^\/]+/ }, as: :project

  get "/feeds/atom", to: "feeds#atom", defaults: { format: :xml }, as: :atom_feed

  mount MissionControl::Jobs::Engine, at: "/jobs"
end

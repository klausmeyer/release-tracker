Rails.application.routes.draw do
  root to: redirect('/projects')

  get '/projects', to: 'projects#index', as: :projects
  get '/projects/:source/:slug', to: 'projects#show', constraints: {source: /\w+/, slug: /\w+\/\w+/}, as: :project
end

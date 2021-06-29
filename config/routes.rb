Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  # get '/stats', to: 'stats#index'
  # get '/admin/stats', to: 'stats#index'

  # scope '/admin' do, module: 'admin' do
    # admin is the url prefix, and the routes will be handled in the admin module
  namespace :admin do 
      # route with the module admin AND use admin as the url prefix
    resources :stats, only: [:index]
    # new helpers: stats_path and stats_url WITH SCOPE
    # new helper: admin_stats_path WITH NAMESPACE
  end

  root 'posts#index'
end

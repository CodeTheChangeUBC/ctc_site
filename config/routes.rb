Rails.application.routes.draw do
  root 'info_pages#index'
  get '/subscribe',                 to: 'info_pages#subscribe'
  get '/about',                     to: 'info_pages#about'
  get '/login',                     to: 'sessions#new'
  post   '/login',                  to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'
  get '/admin',                     to: 'sessions#admin_new'
  get '/admin-panel',               to: 'info_pages#admin_panel'
  delete '/admin-panel',            to: 'info_pages#destroy'

  # API URLS
  get '/auth/:provider/callback',   to: 'sessions#create_with_api'
  
  # Action URLS 
  get    '/home/make_exec',         to: 'members#make_exec'
  get    '/home/unmake_exec',       to: 'members#unmake_exec'

  # SSL URL

  get '/.well-known/acme-challenge/MQHvIkRQk-lJUM5BSmmN-89w5VwX5eYLr4yZgWpZqrg', to:
      'info_pages#letsencrypt_root'
  
  resources :projects
  resources :members, only: [:index, :new, :edit, :update, :create, :destroy]
end

  

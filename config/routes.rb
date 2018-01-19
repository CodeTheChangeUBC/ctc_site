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
  get '/members/past',              to: 'members#past'

  # API URLS
  get '/auth/:provider/callback',   to: 'sessions#create_with_api'
  
  # Action URLS 
  get    '/home/make_exec',         to: 'members#make_exec'
  get    '/home/unmake_exec',       to: 'members#unmake_exec'
  get    '/home/make_past_member',  to: 'members#make_past_member'
  get    '/home/unmake_past_member',to: 'members#unmake_past_member'

  # SSL URL
  get '/.well-known/acme-challenge/:id', to:
      'info_pages#letsencrypt_root'

  resources :projects, except: [:show]
  resources :members, only: [:index, :new, :edit, :update, :create, :destroy]
  resources :posts, except: [:show]
end

  

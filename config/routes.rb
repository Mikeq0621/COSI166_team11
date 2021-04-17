Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/edit'

  resources :requests
  get 'sessions/new'
  resources :transactions
  resources :listings
  resources :users
  resources :hosts
  resources :password_resets, only: [:new, :create, :edit, :update]
  root 'static_page#home'
  get 'static_page/faq'
  get    '/userlogin',   to: 'sessions#new'
  post   '/userlogin',   to: 'sessions#create_user'
  get    '/hostlogin',   to: 'sessions#newhost'
  post   '/hostlogin',   to: 'sessions#create_host'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/host_signup', to: 'hosts#new'
  get '/host_edit', to: 'hosts#edit'
  get '/user_edit', to: 'users#edit'

  get '/userprofile', to: 'users#show'
  get 'hostprofile', to: 'hosts#show'

  get '/search' => 'searches#search', :as => 'search_page'
  get '/listing/:id', to: 'listings#show'
  delete '/deletelisting/:listing_id', to: 'listings#destroy'
  get '/deletelisting/:listing_id', to: 'listings#destroy'
  get '/rent/:listing_id', to: 'requests#new'
  post '/requestlisting', to: 'requests#create'
  delete '/accept/:req_id', to: 'requests#accept'
  get '/accept/:req_id', to: 'requests#accept'
  get '/deny/:req_id', to: 'requests#destroy'
  delete '/deny/:req_id', to: 'requests#destroy'

  post '/resetpassword', to: 'users#reset_password'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

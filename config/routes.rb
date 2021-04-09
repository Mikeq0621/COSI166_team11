Rails.application.routes.draw do
  resources :requests
  get 'sessions/new'
  resources :transactions
  resources :listings
  resources :users
  resources :hosts
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

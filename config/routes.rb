Rails.application.routes.draw do
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

  get '/userprofile', to: 'users#show'
  get 'hostprofile', to: 'hosts#show'

  get '/search' => 'searches#search', :as => 'search_page'
  delete '/listing/:id', to: 'listings#destroy'
  post '/rent/:listing_id', to: 'transactions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

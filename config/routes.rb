Rails.application.routes.draw do
  get 'sessions/new'
  resources :transactions
  resources :listings
  resources :users
  resources :hosts
  root 'static_page#home'
  get 'static_page/faq'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/search' => 'searches#search', :as => 'search_page'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

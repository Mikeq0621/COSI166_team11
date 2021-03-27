Rails.application.routes.draw do
  resources :transactions
  resources :listings
  resources :users
  resources :hosts
  root 'static_page#home'
  get 'static_page/faq'
  get '/search' => 'searches#search', :as => 'search_page'
  delete '/listing/:id', to: 'listings#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

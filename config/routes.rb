Rails.application.routes.draw do
  resources :users
  resources :hosts
  root 'static_page#home'
  get 'static_page/faq'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

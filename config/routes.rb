Rails.application.routes.draw do
  # get 'password_resets/new'
  # get 'password_resets/edit'
  resources :admins 
  get '/adminlogin', to: 'sessions#newadmin'
  post '/adminlogin', to: 'sessions#create_admin'
  delete '/removehost/:host_id',to: 'admins#delete_host'
  delete '/removeuser/:user_id',to: 'admins#delete_user'
  get '/removehost/:host_id',to: 'admins#delete_host'
  get '/removeuser/:user_id',to: 'admins#delete_user'
  get '/admin_listing', to: 'admins#new_listing'
  post '/admin_listing',to:'admins#create_listing'
  get '/admin_request/:listing_id', to: 'admins#new_request'
  post '/admin_request', to: 'admins#create_request'
  get '/admin_transaction/:listing_id', to:'admins#new_transaction'
  post '/admin_transaction', to:'admins#create_transaction'
  
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
  get '/readhost/:user_id', to:'hosts#read_notification'
  get '/user_reset', to: 'password_resets#user_reset'
  post '/user_resetpassword', to: 'users#reset_password'
  get '/host_reset', to: 'password_resets#host_reset'
  post '/host_resetpassword', to: 'hosts#reset_password'
  post '/sendmessage',to: 'hosts#send_message'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

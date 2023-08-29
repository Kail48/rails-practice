Rails.application.routes.draw do
  root "sessions#login"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  get 'test', to: "sessions#test"
  get 'dashboard', to: "users#show_dashboard"
  get 'csv', to: "pirates#csv_export"
  post '/pirates/new', to: "pirates#create"
  get '/pirates/bounty/new/:id', to: "pirates#new_bounty"
  put '/pirates/bounty/new/:id', to: "pirates#update_bounty"
  get '/pirates/csv', to: "pirates#get_csv"
  post 'pirates/csv', to: 'pirates#import'
  get 'api/pirates', to: 'pirates#get_pirates', format: 'json'
  get 'api/pirate/:id', to: 'pirates#get_pirate', format: 'json'
  get 'api/test', to: 'pirates#test'
  get 'test1', to: 'pirates#test1'
  resources :users
  resources :pirates
  resources :crews
end

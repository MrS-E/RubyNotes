Rails.application.routes.draw do
  root 'sessions#login'

  #user
  resources :users, only: [:new, :create, :destroy] #dont need destroy yet

  #session
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  #main
  resources :notes
end
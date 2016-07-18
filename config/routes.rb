Rails.application.routes.draw do
  root 'home#home'

  resources :contents
  resources :users

  #sign in routes
  get '/sign_in', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy', as: 'delete'

  mount Messenger::Engine, at: "/messenger"
  
end

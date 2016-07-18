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


# Messenger Bot Routes
# Messenger::Engine.routes.draw do
#   get  :subscribe, to: "messenger#subscribe"
#   get  :webhook,   to: "messenger#validate"
# end

# Rails.application.routes.draw do
#   post 'messenger/webhook', to: "messenger#webhook"
# end
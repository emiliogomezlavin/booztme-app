Rails.application.routes.draw do
  root to: 'home#home'
  resources :contents
  resources :users
end

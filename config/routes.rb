Rails.application.routes.draw do
  resources :converters, only: :index
  root 'home#index'
end

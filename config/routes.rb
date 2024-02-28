Rails.application.routes.draw do
  resources :converters
  root 'home#index'
end

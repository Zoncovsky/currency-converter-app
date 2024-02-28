Rails.application.routes.draw do
  resources :converters, only: %i[index create]
  resources :users, only: :index
  root 'home#index'
  patch 'update_base_currency', to: 'home#update_base_currency'
end

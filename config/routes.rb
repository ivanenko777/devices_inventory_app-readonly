Rails.application.routes.draw do
  root 'home#index'

  resources :device_manufacturers
  resources :device_models
  resources :device_types
  resources :devices do
    get 'history', on: :member
  end
  resources :offices do
    get 'rooms', on: :member
  end
  resources :rooms
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get 'home/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

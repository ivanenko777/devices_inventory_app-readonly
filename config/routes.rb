Rails.application.routes.draw do
  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  get 'home/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

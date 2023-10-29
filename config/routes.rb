# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }
  root 'users#index'
  resources :likes
  resources :tweets
  resources :users
  get 'like_dislike', to: 'likes#like_dislike'
  post 'like_dislike', to: 'likes#like_dislike'
  get 'profile', to: 'users#profile'
  post 'profile', to: 'users#profile'

  # API
  # : api po estar dentro de una carpeta api
  namespace :api do
    resources :tweets, only: %i[index show create]
    resources :users, only: %i[index show create]
    resources :likes, only: %i[index show create]
    # APIS
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

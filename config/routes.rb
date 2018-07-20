Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users
  resources :friendships
  resources :friend_requests, only: [:index, :create, :show, :destroy, :update]
  resources :friends
end

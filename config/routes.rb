Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :friendships
  resources :friend_requests, only: [:index, :create, :show, :destroy, :update]
  resources :friends
end

Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/update'
  root 'static_pages#home'
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

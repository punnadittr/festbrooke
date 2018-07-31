Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :registrations => "custom_registrations" }
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :friendships
  resources :friend_requests, only: [:index, :create, :show, :destroy, :update]
  resources :friends
end

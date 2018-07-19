Rails.application.routes.draw do
  get 'friends/create'
  get 'friends/index'
  get 'friends/destroy'
  devise_for :users
  root 'static_pages#home'
  post 'users/accept_friend'
  resources :users
  resources :friendships
end

Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "users#index"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
end

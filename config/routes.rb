Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "pets#index"
  resources :pets
  resources :messages, only: [:create, :edit, :update, :destroy]
  resources :rooms, only: [:create, :show, :index]
end

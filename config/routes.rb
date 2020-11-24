Rails.application.routes.draw do
  get 'pets/index'
  get 'pets/new'
  get 'pets/edit'
  get 'pets/show'
  devise_for :users
  resources :users
  root "pets#index"
  resources :pets
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
end

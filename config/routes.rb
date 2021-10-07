Rails.application.routes.draw do
  
  resources :outfits
  resources :stocks, only: [:create, :destroy]
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  root "top#index"

  devise_for :proposers, controllers:{
    sessions: 'proposers/sessions',
    passwords: 'proposers/passwords',
    registrations: 'proposers/registrations'
  }
  resources :proposers, only: [:show]

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
end


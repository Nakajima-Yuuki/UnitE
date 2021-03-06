Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  devise_scope :proposer do
    post 'proposers/guest_sign_in', to: 'proposers/sessions#guest_sign_in'
  end

end


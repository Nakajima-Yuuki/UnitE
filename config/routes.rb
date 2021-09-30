Rails.application.routes.draw do
  get 'proposers/show'
  get 'users/show'
  root "top#index"
  devise_for :proposers, controllers:{
    sessions: 'proposers/sessions',
    passwords: 'proposers/passwords',
    registrations: 'proposers/registrations'
  }
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
end

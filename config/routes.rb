Oliver::Application.routes.draw do
  root 'dashboard#show'
  devise_for :users
  resource :dashboard, only: [:show]
  resources :users, except: [:show]
  resource :user_profile, only: [:edit, :update], controller: 'user_profile'
end

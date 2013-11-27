Oliver::Application.routes.draw do
  root 'dashboard#show'
  devise_for :users
  resource :dashboard, only: [:show]
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'facilities#index'
  resources :facilities, only: [:index, :new, :create, :show]
  #  do
  resources :rooms, only: [:index, :new, :create]
  # end
end
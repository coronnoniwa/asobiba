Rails.application.routes.draw do
  devise_for :users
  root to: 'facilities#index'
  resources :facilities, only: [:index, :new, :create, :show]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
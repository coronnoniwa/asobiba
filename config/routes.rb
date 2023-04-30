Rails.application.routes.draw do
  devise_for :users
  root to: 'facilities#index'
  resources :facilities, only: :index
end

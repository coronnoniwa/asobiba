Rails.application.routes.draw do
  root to: 'facilities#index'
  resources :facilities, only: :index
end

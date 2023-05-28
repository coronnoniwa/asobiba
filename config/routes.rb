Rails.application.routes.draw do
  devise_for :users
  root to: 'facilities#index'
  resources :facilities, only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
  end
end
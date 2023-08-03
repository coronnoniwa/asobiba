Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'facilities#index'
  resources :facilities, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    member do
      get 'room_list/:per', to: 'facilities#room_list_page', as: 'room_list'
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy] do
    collection do
      get 'search'
      get 'room_list/:per', to: 'rooms#room_list_page', as: 'room_list'
    end
    resources :messages, only: [:index, :create]
  end

  get "room_list/:per" => "rooms#room_list_page"
  get "room_list" => "room#room_list"
end
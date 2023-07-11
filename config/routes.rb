Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'rooms#join_action'

  get 'join_action', to: 'rooms#join_action', as: 'join_action'

  resources :rooms, only: [:index, :new, :create] do
    resources :tasks do
      resources :mytasks, only: [:create, :destroy] 
      resources :comments, only: [:edit, :update, :create]
    end
  end
end
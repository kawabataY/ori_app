Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'rooms#join_action'

  get 'join_action', to: 'rooms#join_action', as: 'join_action'

  resources :rooms, only: [:index, :new, :create] do
    resources :tasks do
      resources :comments, only: [:edit, :update, :create]
      resources :mytasks, only: [:create, :destroy] 
      resources :donetasks, only: [:create]
    end
    resources :shoppinglists, only: [:index, :new, :create, :edit, :update,:destroy] do
      post 'generate_answer', on: :collection
    end
  end
end
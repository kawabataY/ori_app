Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'rooms#join_action'

  get 'join_action', to: 'rooms#join_action', as: 'join_action'

  resources :rooms, only: [:index, :new, :create] do
    resources :tasks, only: [:index, :new, :create]
  end
end
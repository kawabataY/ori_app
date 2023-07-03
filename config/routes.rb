Rails.application.routes.draw do
  devise_for :users #, controllers: { registrations: 'registrations' }
  root to: 'rooms#index'
  resources :tasks
  resources :rooms, only: [:index, :new, :create] 
end
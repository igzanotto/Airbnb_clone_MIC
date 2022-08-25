Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :flats do
    resources :reservations, only: %i[new create]
  end
  get 'this_flat_reservations', to: 'flats#this_flat_reservations', as: 'this_flat_reservations'

  resources :reservations, only: %i[index new show edit update destroy]
end

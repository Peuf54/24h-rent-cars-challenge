Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cars, only: %w[index show new create]
  resources :bookings, only: %w[create]
end

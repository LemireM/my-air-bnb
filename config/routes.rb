Rails.application.routes.draw do
  resources :properties do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]

  root 'properties#index'
end

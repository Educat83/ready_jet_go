Rails.application.routes.draw do
  get 'listings/index'
  devise_for :users
  root to: "pages#home"

  resources :planes do
    resources :reviews, only: %i[new]
    resources :bookings, only: [:new, :create, :edit, :update, :index]
  end

  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: %i[create]
  end

  resources :reviews, only: [:show, :destroy]

  get "listings", to: "listings#index", as: :listings
end

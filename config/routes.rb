Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :planes do
    resources :bookings, only: [:new, :create, :edit, :update, :index]
  end

  resources :bookings, only: [:index, :destroy]
end

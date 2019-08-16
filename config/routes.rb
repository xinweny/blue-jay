Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bands, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update]

  get 'my_bands', to: 'bands#my_bands', as: :my_bands
end

Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: 'pages#about'

  resources :lives do
    resources :bookings
      resources :reviews, only: [:new, :create]

  end

  get "/users/show", to: "users#show"
  patch "/users/show", to: "users#update"

  get '/bookings', to: 'bookings#index', as: 'bookings'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'

  get "up" => "rails/health#show", as: :rails_health_check

end

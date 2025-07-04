Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/create'
  devise_for :users
  root to: "pages#home"

  resources :lives do
    resources :reviews, only: [:new, :create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

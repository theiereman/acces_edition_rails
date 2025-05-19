Rails.application.routes.draw do
  resources :events
  devise_for :users

  namespace :api do
    resources :events
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end

Rails.application.routes.draw do
  resources :events
  devise_for :users

  namespace :api, defaults: { format: :json } do
    resources :events
    devise_scope :user do
      post "users/sign_in", to: "api_sessions#create"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end

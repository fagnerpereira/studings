Rails.application.routes.draw do
  get "up" => "rails/health#show", :as => :rails_health_check

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"

  resources :users, only: :show
end

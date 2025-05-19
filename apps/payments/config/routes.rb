Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "checkout/success" => "checkout#success"
  get "checkout" => "checkout#show"
  post "checkout/create" => "checkout#create"
  get "billing" => "billing#show"

  get "search" => "search#show"
  


  # Defines the root path route ("/")
  # root "posts#index"
end

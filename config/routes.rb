Rails.application.routes.draw do
  root "welcome#index"

  resources :tweets

  get "/complete_info/:id", to: "tweets#complete_info"

  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "/logout", as: :logout, to: "sessions#destroy"
end

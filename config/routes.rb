Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  devise_for :users

  resources :tutors, only: [:index, :show]
  resources :sessions, only: [:new, :create]

  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # subjects#index
  get "subjects", to: "subjects#index"
  get "mysubjects", to: "subjects#mysubjects"
end

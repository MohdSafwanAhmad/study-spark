Rails.application.routes.draw do
  devise_for :users
  resources :tutors, only: [:index, :show]
  resources :tutoring_sessions, only: [:new, :create, :index, :show]
  root to: "pages#home"
  
  resources :studies do
    member do
      get :upload_materials
      patch :attach_materials
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # subjects#index
  get "subjects", to: "subjects#index"

  # Learner view to their subjects and learning objectives
  get "mysubjects", to: "studies#mysubjects"

  # View Materials associated with a Study
  get 'studies/:study_id/materials', to: 'materials#index', as: 'study_materials'

  # Index and show for tutors
  resources :tutors, only: %i[index show]
end

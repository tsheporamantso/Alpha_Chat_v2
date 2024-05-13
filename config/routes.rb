Rails.application.routes.draw do

  root "pages#home"

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :users, except: [:new]

  get "signup", to: "users#new"

  get "about", to: "pages#about"

  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

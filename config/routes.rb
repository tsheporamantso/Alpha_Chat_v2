Rails.application.routes.draw do
  root "pages#home"
  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, except: [:new]
  get "signup", to: "users#new"
  get "about", to: "pages#about"
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"

end

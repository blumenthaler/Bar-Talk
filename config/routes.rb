Rails.application.routes.draw do
  root "sessions#index"
  get '/signup', to: "users#new", as: "signup"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, only: [:show, :index] do
    resources :recipes, only: [:show, :index, :new, :edit]
  end
  resources :recipes
  resources :users
  resources :sessions
  resources :cocktails
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
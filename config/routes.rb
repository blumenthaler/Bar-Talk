Rails.application.routes.draw do
  root "sessions#index"
  get '/signup', to: "users#new", as: "signup"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users do
    resources :recipes, only: [:new, :create, :index]
  end

  # cocktails/2/recipes/new #=> Add a recipe to THIS Cocktail (new) (redirect to cocktail_path(cocktail))
  # resources :cocktails do
  #   resources :recipes, only: [:new, :create]
  # end

  resources :recipes
  resources :users
  resources :sessions
  resources :cocktails
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
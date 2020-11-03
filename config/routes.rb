Rails.application.routes.draw do
  get '/signup', to: "users#new", as: "signup"
  get '/', to: "sessions#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  resources :sessions
  resources :recipes
  resources :cocktails
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

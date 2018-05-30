Rails.application.routes.draw do
  get '/', to: "sessions#index"
  get '/auth/github/callback', to: 'sessions#create'
  post '/signin', to: "sessions#signin"
  get '/logout', to: "sessions#logout"

  resources :users, only: [:index, :new, :create, :show]
  resources :beers
  resources :user_beers, only: [:create, :edit, :update, :destroy]

  resources :users do
    resources :beers, only: [:index, :new, :create]
  end
end

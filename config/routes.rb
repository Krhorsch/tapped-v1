Rails.application.routes.draw do
  get '/', to: "sessions#index"
  get '/auth/github/callback', to: 'sessions#create'
  post '/signin', to: "sessions#signin"
  post '/userbeers', to: "user_beers#create"
  get '/logout', to: "sessions#logout"
  resources :users, only: [:index, :new, :create, :show]
  resources :beers

  resources :users do
    resources :beers, only: [:index, :new, :create]
  end
end

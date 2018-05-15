Rails.application.routes.draw do
  get '/', to: "sessions#index"
  get '/auth/github/callback', to: 'sessions#create'
  post '/signin', to: "users#signin"
  resources :users, only: [:new, :create, :show]
  resources :beers

  resources :users do
    resources :beers, only: [:index, :new, :create]
  end
end

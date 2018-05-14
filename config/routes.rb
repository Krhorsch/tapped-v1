Rails.application.routes.draw do
  get '/', to: "sessions#index"
  get '/auth/github/callback', to: 'sessions#create'
  resources :beers
end

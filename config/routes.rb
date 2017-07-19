Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sneakers
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'users#new'
end

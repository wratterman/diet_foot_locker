Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sneakers, only: [:index, :show, :create]
  namespace :admin do
    resources :sneakers, except: [:index, :show, :create]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'users#new'
end

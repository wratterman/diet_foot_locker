Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sneakers, only: [:index, :show, :create, :update]
  namespace :admin do
    resources :sneakers, only: [:new, :edit, :destroy] do
      resources :reviews, only: [:new, :create]
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'sneakers#index'
end

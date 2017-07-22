Rails.application.routes.draw do
  resources :users, except: [:index, :destroy]

  resources :sneakers, only: [:index, :show, :create, :update] do
    resources :reviews, only: [:new, :create, :index]
  end

  namespace :admin do
    resources :sneakers, only: [:new, :edit, :destroy]
    resources :brands, only: [:new, :edit, :destroy]
    resources :sports, only: [:new, :edit, :destroy]
  end

  resources :brands do
    resources :sneakers, only: [:index]
    resources :sports do
      resources :sneakers, only: [:index]
    end
  end

  resources :sports do
    resources :sneakers, only: [:index]
    resources :brands do
      resources :sneakers, only: [:index]
    end
  end

  resources :home, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'home#index'
end

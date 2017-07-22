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
  end

  resources :sports do
    resources :sneakers, only: [:index]
  end

  resources :home, only: [:index]

  get '/sports/:id/brands', to: 'sports#brands', as: 'sport_brands'
  get '/brands/:id/sports', to: 'brands#sports', as: 'brand_sports'

  get '/sports/:id/brand/:id', to: 'sports#show_brand_sneakers', as: 'sport_brand'
  get '/brands/:id/sports/:id', to: 'brands#show_sport_sneakers', as: 'brand_sport'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'home#index'
end

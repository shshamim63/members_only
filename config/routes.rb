Rails.application.routes.draw do

  root 'posts#index'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, except: [:index]
  resources :posts
  resources :session, only: [:new, :create, :destroy]
end

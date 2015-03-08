Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users
  get '/users', to: 'users#index', as: 'users'
  get '/user/:id', to: 'users#show', as: 'user'
  get '/user/:id/reviews', to: 'users#reviews_list', as: 'reviews_user'
  get '/user/:id/products', to: 'users#products', as: 'products_user'

  root 'categories#index'
end

Rails.application.routes.draw do
  #get '/', to: 'users#home', as: 'root'
  # get '/users', to: 'users#index'
  # get '/users/new', to: 'users#new'
  # get '/users/:id', to: 'users#show', as: 'users_show'
  # post '/users', to: 'users#create'

  # get '/products', to: 'products#index'
  # get '/users/:user_id/products/:id', to: 'products#show', as: 'user_products_show'
  # get '/users/:user_id/products/new', to: 'products#new', as: 'user_products_new'
  # post '/users/:user_id/products', to: 'products#create', as: 'user_products_create'



  resources :users do
    resources :products
  end
end

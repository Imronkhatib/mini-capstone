Rails.application.routes.draw do
  
  post 'user_token' => 'user_token#create'
  namespace :v1 do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    post '/users' => 'users#create'
    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    post '/carted-product' => 'carted_products#create'
    get '/carted-products' => 'carted_products#index'
  end
end
Rails.application.routes.draw do
  
  namespace :v1 do
    get '/product-page' => 'products#all_products'
    get '/walets' => 'products#walet'
    get '/any-product' => 'products#any'
    get '/the-product/:id' => 'products#any'
  end
end
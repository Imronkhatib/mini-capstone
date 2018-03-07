Rails.application.routes.draw do
  get '/product-page' => 'products#all_products'
  get '/walets' => 'products#walet'
end


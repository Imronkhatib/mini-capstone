class V1::CartedProductsController < ApplicationController

  def index
    p "*" * 50
    p current_user
    p "*" * 50
    unless current_user
      render json: {message: 'you need to be logged in'}
    else
      carted_product = CartedProduct.where(status: "carted", user_id:current_user)
      render json: carted_product.as_json
    end
  end

  def create
    p "*" * 50
    p current_user
    p "*" * 50
    unless current_user
      render json: {message: 'you need to be logged in'}
    else
      cart = CartedProduct.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity]
        )
      cart.save
      p cart.errors.full_messages
    end
  end
end
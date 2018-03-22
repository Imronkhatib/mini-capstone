class V1::OrdersController < ApplicationController

  def create
    order = Order.new(
      {
        user_id:params[:user_id],
        product_id: params[:product_id],
        quantity: params[:quantity],
        #compute this to automatically do the maths based off the user input in the frontend.rb
        subtotal: params[:subtotal],
        tax: params[:tax],
        total: params[:total]
      }
    )
    order.save
    render json: order
  end
end

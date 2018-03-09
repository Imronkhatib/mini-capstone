class V1::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def walet
    new_walet = Product.find_by(id: 3)
    render json: new_walet.as_json   
  end
  def any
    #get user input
    user_input = params[:id]
    #based on the user input, find a product in the db
    the_product = Product.find_by(id: user_input)
    #show that product to the user
    render json: the_product.as_json
  end
end

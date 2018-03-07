class ProductsController < ApplicationController

  def all_products
    the_products = Product.all

    render json: the_products.as_json
  end

  def walet
    new_walet = Product.find_by(id: 3)

    render json: new_walet.as_json   
  end
end

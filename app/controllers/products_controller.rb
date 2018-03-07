class ProductsController < ApplicationController

  def all_products
    new_shoe = Product.all

    render json: new_shoe.as_json
  end

  def walet
    new_walet = Product.find_by(id: 3)

    render json: new_walet.as_json   
  end
end

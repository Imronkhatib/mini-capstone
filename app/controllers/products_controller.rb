class ProductsController < ApplicationController

  def nike_shoe
    new_shoe = Product.all

    render json: new_shoe.as_json
  end
end

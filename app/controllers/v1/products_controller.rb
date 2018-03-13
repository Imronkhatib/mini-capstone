class V1::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end

  # def create
  #   product1 = Product.new(
  #     :name params[:name_input]
  #     :price params[:price_input]
  #     :image_url params[:image_url_input]
  #     :description params[:description_input]
  #   )
  #   product1.save
  #   render json: product1.as_json
  # end
  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json

    product1 = Product.update(
      name: "something",
      price: 1000,
      image_url: null,
      description: "These shoes are super comfortable",
      )
  end
end







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

  def create
    product1 = Product.new(
      name: params[:name],
      price: params[:price],
      stock: params[:stock],
      image_url: params[:image_url],
      description: params[:description]
    )
    if product1.save
    render json: product1.as_json
  else
    render json: {errors: product1.errors.full_messages}
  end
  end
  
  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json

    product1 = Product.update(
      name: params[:name],
      price: params[:price],
      stock: params[:stock],
      image_url: params[:image_url],
      description: params[:description]
      )
  end
end







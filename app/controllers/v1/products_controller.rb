class V1::ProductsController < ApplicationController

  def index
    search_term = params[:search]
    products = Product.all.order(id: :asc).where('price = ?', "#{search_term}")
    # products = Product.all
    # products = Product.all.order(id: :asc).where('name LIKE ?', "%#{search_term}%")
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

    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.stock = params[:stock] || product.stock
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.save
    
      render json: product.as_json
    # else
    #   render json: {errors: product.errors.full_messages}
  end
end







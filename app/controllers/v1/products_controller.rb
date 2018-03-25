class V1::ProductsController < ApplicationController

  def index
    p  "*" * 50
     p current_user
    p "*" * 50 
     # p current_user.admin
     # "*" * 50
    search_term = params[:search]
    sort_by_price = params[:sort_price]
    # if sort_by_price == true
    #   products = Product.all.order(price: :asc).where('name LIKE ?', "%#{search_term}%")
    # else
    products = Product.all.order(id: :asc).where('name LIKE ?', "%#{search_term}%")
    # end
    render json: products.as_json
  end

  def create
      p '*' * 50 
    p current_user
      p '*' * 50
    if current_user && current_user.admin
      product = Product.new(
        name: params[:name],
        price: params[:price],
        stock: params[:stock],
        description: params[:description]
      )
      if product.save
        render json: product.as_json
      else
        render json: {errors: product.errors.full_messages}
      end
    else
      render json: {message: 'You do not have permission to do this bruh.'}
    end
  end


  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end
  
  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)

    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.stock = params[:stock] || product.stock
    product.price = params[:price] || product.price
    
    product.save
    render json: product.as_json
    # else
    #   render json: {errors: product.errors.full_messages}
  end
end







class Image < ApplicationRecord
  def product
    product.find_by(id: product_id)
  end
end

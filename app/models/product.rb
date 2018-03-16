class Product < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :description, length: {in: 10...500}


  def as_json
    {id: id,
     name: name,
     image: image,
     price: price,
     tax: tax,
     total: total,
     stock: stock,
     description: description,
     is_discounted: is_discounted?,
     supplier: supplier
    }
  end

  def is_discounted?
    price < 20
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)    
  end
end

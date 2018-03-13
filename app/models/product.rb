class Product < ApplicationRecord

  def as_json
    {id: id,
     price: price,
     tax: tax,
     total: total,
     image_url: image_url,
     description: description,
     is_discounted: is_discounted?
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
end

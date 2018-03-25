class User < ApplicationRecord
  belongs_to :carted_product
  has_many :orders
  has_many :products
  has_secure_password
end

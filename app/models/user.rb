class User < ApplicationRecord
  has_many :carted_product
  has_many :orders
  has_secure_password
end

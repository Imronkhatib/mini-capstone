class Order < ApplicationRecord
  # has_many :users, through: :carted_product
  belongs_to :carted_product
end

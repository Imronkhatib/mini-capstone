class CorrectDatatypeforPriceinProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :decimal, precision:9, sale: 2
  end
end

class AddStocktoProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :stock, :string
  end
end

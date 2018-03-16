class CorrectTypeforProductId < ActiveRecord::Migration[5.1]
  def change
    change_column :images, :product_id, :integer
  end
end

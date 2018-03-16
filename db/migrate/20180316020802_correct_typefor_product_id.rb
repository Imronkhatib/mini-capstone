class CorrectTypeforProductId < ActiveRecord::Migration[5.1]
  def change
      #unable to migrate, due to error (potential due to it being a string)
    change_column :images, :product_id, :string
  end
end

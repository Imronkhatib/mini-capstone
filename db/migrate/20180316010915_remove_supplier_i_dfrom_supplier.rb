class RemoveSupplierIDfromSupplier < ActiveRecord::Migration[5.1]
  def change
    remove_column :suppliers, :supplier_id, :integer
  end
end

class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :carted_product, :carted_products
  end
end

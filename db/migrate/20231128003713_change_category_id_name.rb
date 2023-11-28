class ChangeCategoryIdName < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_products, :category, :category_id
  end
end

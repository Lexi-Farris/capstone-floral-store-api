class CreateCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_products do |t|
      t.integer :product_id
      t.integer :category

      t.timestamps
    end
  end
end

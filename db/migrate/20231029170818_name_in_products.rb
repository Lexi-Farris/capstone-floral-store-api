class NameInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :name, :string

  end
end

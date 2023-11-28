class Category < ApplicationRecord
  has_many :category_products

  #ONLY works if the above 'join table' model has been declared
  has_many :products, through: :category_products



end

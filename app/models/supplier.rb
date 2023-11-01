class Supplier < ApplicationRecord

  has_many :products


# WHAT'S UNDER THE HOOD OF HAS_MANY :PRODS
  # def products
  #   products = Product.where(supplier_id: id)
  #   return products
  # end
end

class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # optional :true allows you to set the column to null when dealing foreign ids
  belongs_to :order, optional: true

  
end

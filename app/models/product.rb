class Product < ApplicationRecord
  
  def is_discounted?
    cost = self.price
    if cost <= 10
      true 
    else
      cost > 10
      false
    end
  end


end

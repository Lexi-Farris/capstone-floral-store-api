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

  def tax
    price * 0.09
  end

  def total
    price + tax  
  end
   



end

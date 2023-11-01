class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 20}
  validates :price, presence: true, numericality: { greater_than:0 }
  validates :description, presence: true, length: {in: 10..500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i,
  # :message => "must have a valid file type", multiline: true
  
belongs_to :supplier


  #THIS IS WHAT'S UNDER THE HOOD OF BELONGS TO: SUPPLIER
  # def supplier
  #   supplier = Supplier.find_by(id: supplier_id)
  #   return supplier
  # end


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

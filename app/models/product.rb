class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 20}
  validates :price, presence: true, numericality: { greater_than:0 }
  validates :description, presence: true, length: {in: 10..500 }
  # validates_format_of :, :with => %r{\.(png|jpg|jpeg)$}i,
  # :message => "must have a valid file type", multiline: true
  
belongs_to :supplier
has_many :images
has_many :orders
has_many :category_products 
#allows access to cateogires in my jbuilder; can now say Products.first.category 
has_many :categories, through: :category_products
has_many :carted_products 


  #THIS IS WHAT'S UNDER THE HOOD OF BELONGS TO: SUPPLIER
  # ---->>>THIS also gives you access to the METHOD supplier now
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
   
  def item_search
    products.each do |p|
      Product.find_by

    end 
  end




end

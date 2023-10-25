class ProductsController < ApplicationController
  # def orchid_lovers 
  #   flower = Product.first
  # render json: flower.as_json
  # end

  # def dahlia_lovers 
  #   flower2 = Product.last
  #   render json: flower2.as_json
  # end

  def orchid_lovers         #returns single product to page
    flower = Product.find_by(id: params["id"])
    render json: flower.as_json
  end

  def dahlia_lovers
    flower2 = Product.find_by(name: params["name"])
    render json: flower2.as_json
  end
  
end

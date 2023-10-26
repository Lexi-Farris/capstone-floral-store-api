class ProductsController < ApplicationController
  # def orchid_lovers 
  #   flower = Product.first
  # render json: flower.as_json
  # end

  # def dahlia_lovers 
  #   flower2 = Product.last
  #   render json: flower2.as_json
  # end

  # def orchid_lovers         #returns single product to page
  #   flower = Product.find_by(id: params["id"])
  #   render json: flower.as_json
  # end

  #remember to add .json at the end of the url for this to work: http://localhost:3000//liliopsidas/1.json
  
  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def index
    @products = Product.all
    render template: "products/index"
  end
  
end

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
    if @product     #if product Is found, show the following template
      render template: "recipies/show"
    else
      render json: {}
    end
  end

  def index
    @products = Product.all
    render template: "products/index"
  end

  def create
    @product = Product.create(
      name: params["title"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      image_url: params["image_url"] || @product.image_url,
      description: params["description"] || @product.description
    )
    render template: "products/show"
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy 
    render json: {message: "Product removed from database."}
  end
end

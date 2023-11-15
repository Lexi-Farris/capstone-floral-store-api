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
      render template: "products/show"
    else
      render json: {}
    end
  end

  def index
    pp current_user
    @products = Product.all
    render template: "products/index"
  end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      supplier_id: params["supplier_id"]
    )
    if @product.valid?
      Image.create(url: params[:url], product_id: @product.id)
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: 406
    end

  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description
    )
    
    if @product.valid?
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end

  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy 
    render json: {message: "Product removed from database."}
  end
end




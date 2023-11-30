class CartedProductsController < ApplicationController
 
  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil,
    )
    if @carted_product.valid?
      render :show
    else
      render json: {errors: @carted_product.errors.full_messages}, status: 422
    end
  end

  def index 
    @carted_products = CartedProduct.all 
    render :index
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    carted_product.update(status: "removed")
    render json: {status: " Item removed"}
  end

end

class OrdersController < ApplicationController
  
  def index
    @orders = Order.all 
    render :index
  end

  def create
    @product=Product.find_by(id: params["id"])
    subtotal= @product * quantity
    total =  subtotal + tax
    
    @order = Order.create(
      product_id: params[:product_id],
      current_user: current_user.id,
      quantity: params[:quantity],
      #subtotal: params[:subtotal],
      tax: params[:tax],
      #total: params[:total]
    )
    render json "Order confirmed."
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end



end

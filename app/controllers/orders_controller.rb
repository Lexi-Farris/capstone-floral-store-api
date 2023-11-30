class OrdersController < ApplicationController
  before_action :authenticate_user  

  def index
    @orders = Order.all 
    @orders = current_user.orders
    render :index
  end

  def create
  #finds current user's prods w/ status of 'carted'
    carted_products = current_user.carted_products.where(status: "carted")

    #creates an order with the following totals
    calculated_subtotal = 0
    carted_products.each do |carted_product| 
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end
  

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax


    @order = Order.create(
      
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    #changes the order's status to purchased IF order is successfully created
    if @order.valid?
      carted_products.update_all(status: "purchased", order_id: @order.id)
      render :show
    else
      render json: {errors: @order.errors.full_messages}, status: 422
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end



end

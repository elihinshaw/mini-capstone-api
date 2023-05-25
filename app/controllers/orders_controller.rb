class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @orders = current_user.orders
      render :index
    end
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render :show
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    calculated_tax = 0
    calculated_total = 0

    carted_products.each do |carted_product|
      product = carted_product.product
      quantity = carted_product.quantity
  
      calculated_subtotal = product.price * quantity
      calculated_tax = product.tax * quantity
      calculated_total = calculated_subtotal + calculated_tax
    end


    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.valid?
      render :show
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end

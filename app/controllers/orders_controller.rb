class OrdersController < ApplicationController
  before_action :authenticate_admin

  def index
    if current_user
      @orders = current_user.orders
      render :index
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render :show
  end

  def create
    if current_user
      product = Product.find_by(id: params["product_id"])
      quantity = params["quantity"].to_i

      calculated_subtotal = product.price * quantity
      calculated_tax = product.tax * quantity
      calculated_total = calculated_subtotal + calculated_tax

      @order = Order.create(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )

      if @order.valid?
        render :show
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end
end

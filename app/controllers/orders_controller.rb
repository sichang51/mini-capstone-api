class OrdersController < ApplicationController
  def create
    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params["quantity"],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    #happy path
    if @order.valid?
      render template: "orders/show"
    else #sad path
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def show
    @order = Order.find_by(user_id: current_user.id)
    render template: "orders/show"
  end

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end
end

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
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
end

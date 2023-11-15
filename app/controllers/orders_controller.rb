class OrdersController < ApplicationController
  def create
    @order = Order.create(
      user_id: params[:user_id],
      product_id: params[:product_id],
      name: params["name"],
      price: params["price"],
      description: params["description"],
      inventory: params["inventory"],
      supplier_id: params[:supplier_id],
      quantity: params["quantity"],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
  end
end

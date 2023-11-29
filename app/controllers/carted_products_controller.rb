class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.create(
      user_id: params[:user_id],
      order_id: params[:order_id],
      product_id: params[:product_id],
      quantity: params["quantity"],
      status: params[:status],
    )
    #happy path
    if @carted_product.valid?
      render :show
    else #sad path
      render json: { errors: @cart.errors.full_messages }, status: 422
    end
  end
end

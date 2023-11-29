class CartedProductsController < ApplicationController
  def index
    @carted_product = current_user.carted_products.where(status: "carted")
    render :index
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      order_id: nil,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )

    #happy path
    if @carted_product.valid?
      render :show
    else #sad path
      render json: { errors: @carted_product.errors.full_messages }, status: 422
    end
  end
end

class ProductsController < ApplicationController
  def all_products
    all_products = Product.all
    render json: { product: all_products }
  end

  def first_product
    first_product = Product.first
    render json: { product: first_product }
  end
end

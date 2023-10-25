class ProductsController < ApplicationController
  def all_products
    all_products = Product.all
    render json: { all_products: all_products }
  end

  def first_product
    first_product = Product.first
    render json: { first_product: first_product }
  end
end

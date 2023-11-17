class ProductsController < ApplicationController
  # def all_products
  #   all_products = Product.all
  #   render json: { all_products: all_products }
  # end

  # def all_products
  #   @products = Product.all
  #   render template: "products/index"
  # end

  # def first_product
  #   first_product = Product.first
  #   render json: { first_product: first_product }
  # end

  # def second_product
  #   product = Product.second
  #   render json: product.as_json
  # end

  # def one_product
  #   product = Product.find_by(id: params["id"])
  #   render json: product.as_json
  # end

  # def one_product
  #   @product = Product.find_by(id: params["id"])
  #   render template: "products/show"
  # end

  before_action :authenticate_admin, except: [:index, :show]

  def index
    # pp current_user
    @products = Product.all
    render template: "products/index"
  end

  # def create
  #   @product = Product.create(
  #     product: "Video Game",
  #     name: "Star Wars Jedi: Fallen Order",
  #     price: 70,
  #     description: "Star Wars Jedi: Fallen Order is an action-adventure video game played from a third-person perspective. The player can use their lightsaber to strike at enemies, or block incoming attacks. Blocking an attack depletes a character's block meter, opening them up to attack when the meter hits zero.",
  #     image_url: "https://static.wikia.nocookie.net/starwars/images/5/57/Fallen-Order-Box-Art.jpg/revision/latest?cb=20190607015712",
  #   )
  #   render template: "products/show"
  # end

  def create
    @product = Product.create(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      inventory: params["inventory"],
      supplier_id: params[:supplier_id],
    )

    # happy path - things saved successfullly!
    if @product.valid?
      Image.create(url: params[:image_url], product_id: @product.id)
      # render template: "products/show"
      render :show
      # sad path - didn't save, we render errors
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      # or status: 422
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      supplier_id: params["supplier_id"] || @product.supplier_id,
    )
    if @product.valid?
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { message: "Product successfully destroyed!" }
  end
end

# Add an if / else condition to your controller create action to deal with happy / sad paths for Create and Update actions
# add in tests to products_controller_test for create and update
# check products.yml and make sure data is passes validations

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

  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
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
      product: params["product"],
      name: params["name"],
      price: params["price"],
      description: params["description"],
      image_url: params["image_url"],
      inventory: params["inventory"],
    )
    # happy path - things saved successfullly!
    if @product.valid?
      render template: "products/show"
      # render :show
      # sad path - didn't save, we render errors
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      # or status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      product: params["product"] || @product.product,
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      image_url: params["image_url"] || @product.image_url,
      inventory: params["inventory"] || @product.inventory,
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
    render json: product.as_json
  end
end

# Add an if / else condition to your controller create action to deal with happy / sad paths for Create and Update actions
# add in tests to products_controller_test for create and update
# check products.yml and make sure data is passes validations

def index
  @suppliers = Supplier.all
  render template: "suppliers/index"
end

def show
  @supplier = Supplier.find_by(id: params["id"])
  render template: "suppliers/show"
end

def create
  @supplier = Supplier.create(
    name: params["name"],
    email: params["email"],
    phone_number: params["phone_number"],
  )
  # happy path - things saved successfullly!
  if @supplier.valid?
    render template: "suppliers/show"
    # render :show
    # sad path - didn't save, we render errors
  else
    render json: { errors: @supplier.errors.full_messages }, status: :unprocessable_entity
    # or status: 422
  end
end

def update
  @supplier = Supplier.find_by(id: params["id"])
  @supplier.update(
    name: params["name"] || @supplier.name,
    email: params["email"] || @supplier.email,
    phone_number: params["phone_number"] || @product.phone_number,
  )
  if @supplier.valid?
    render template: "suppliers/show"
  else
    render json: { errors: @supplier.errors.full_messages }, status: 422
  end

  def destroy
    supplier = Supplier.find_by(id: params["id"])
    supplier.destroy
    render json: supplier.as_json
  end
end

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "tax", "total", "is_discounted?", "images", "description", "inventory", "supplier", "categories"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      # user = user.create(name: "Admin", email: "admin@test.com", password: "password", admin: true)
      # post "/sessions.json", params: { email: "admin@test.com", password: "password" }
      # data = JSON.parse(response.body)
      # jwt = data["jwt"]

      post "/products.json",
           headers: { "Authorization" => "Bearer #{@jwt}" },
           params: { name: "test name", price: 1, description: "test description", supplier_id: Supplier.first.id }

      data = JSON.parse(response.body)
      assert_response 200
      refute_nil data["id"]
      assert_equal "test name", data["name"]
      assert_equal 1.0, data["price"].to_i
      assert_equal "test description", data["description"]
    end

    assert_difference "Product.count", 0 do
      post "/products.json",
           headers: { "Authorization" => "Bearer #{@jwt}" },
           params: {}
      assert_response 422

      post "/products.json"
      assert_response 401
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
          headers: { "Authorization" => "Bearer #{@jwt}" },
          params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json",
          headers: { "Authorization" => "Bearer #{@jwt}" },
          params: { name: "" }
    assert_response 422

    patch "/products/#{product.id}.json"
    assert_response 401
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json",
             headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end
end

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

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
    assert_equal ["id", "product", "name", "price", "tax", "total", "is_discounted?", "description", "image_url", "inventory", "supplier"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { product: "test product", name: "test name", price: 1, description: "test description", image_url: "image.jpg", supplier_id: Supplier.first.id }
      data = JSON.parse(response.body)
      assert_response 200
      assert_equal "test product", data["product"]
      assert_equal "test name", data["name"]
      assert_equal 1.0, data["price"].to_i
      assert_equal "image.jpg", data["image_url"]
      assert_equal "test description", data["description"]
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.image_url, data["image_url"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end

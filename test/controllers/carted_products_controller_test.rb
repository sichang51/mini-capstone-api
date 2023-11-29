require "test_helper"

class CartedProductsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "carted_product.count", 1 do
      post "/cart.json", params: { user_id: 1, product_id: 2, quantity: 5, status: "carted", order_id: 1 }
      assert_response 201
    end
  end
end

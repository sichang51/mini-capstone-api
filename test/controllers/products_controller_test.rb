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
    assert_equal ["id", "product", "name", "price", "description", "image_url"], data.keys
  end

  # test "create" do
  #   assert_difference "Product.count", 1 do
  #     post "/products.json", params{
  #       product:"Video Game",
  #       name: ""
  #     }
  #   assert_response 200
  # end
end

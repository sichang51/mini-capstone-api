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

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: {
                               product: "Video Game",
                               name: "Halo Infinite",
                               price: 60,
                               description: "Halo Infinite is a first-person shooter. In the game's story mode, players assume the role of player character Master Chief, as he wages a war against the Banished, an alien faction. Players traverse the open world Zeta Halo, fighting the Banished with a mixture of vehicles and weapons.",
                               image_url: "https://e.snmc.io/lk/l/x/9e594f7553b3d51b53a7a4ce79b3db3b/8926517",

                             }
    end
  end
end

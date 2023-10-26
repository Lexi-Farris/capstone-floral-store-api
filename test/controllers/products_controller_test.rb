require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
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
    assert_equal ["id", "name", "price", "image_url", "description"], data.keys
  end

  test "create" do 
    assert_difference "Product.count", 1 do 
    post "/products.json", params: {name: "test string", price: 143, image_url: "test string", description: "string of content here"}
    end

  end  


end
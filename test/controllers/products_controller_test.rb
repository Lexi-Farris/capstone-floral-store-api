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
    assert_equal ["id", "name","is_discounted?","total", "description", "supplier"], data.keys
  end

  test "create" do 
    assert_difference "Product.count", 1 do 
    post "/products.json", params: {name: "test string", price: 143, description: "string of content here", supplier_id: Supplier.first.id}
    assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 406
    end
  end


 

  test "update" do
    product = Product.first 
    put "/products/#{product.id}.json", params: {name: "NEW"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "NEW", data["name"]
    # assert_equal product.total, data["total"]
    assert_equal product.description, data["description"]

    put "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end


 

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

  

  

end
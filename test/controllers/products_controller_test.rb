require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    #sending post request to the API  below:
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    #saving the response to the 'data' variable
    data = JSON.parse(response.body)
    #saving the jwt in an instance variable so it's accessible throughout this code. Also, retrieving the value from the hash using 'data["jwt"]'
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
    assert_equal ["id", "name","is_discounted?","total", "description", "supplier", "images"], data.keys
  end

  #Token needed to auth before actions below take place:

  test "create" do 
      assert_difference "Product.count", 1 do 
      post "/products.json", 
      #passing the jwt as a header request to the API before passing the params to post new products
      headers: {"Authorization" => "Bearer #{@jwt}"},
      params: {name: "test string", price: 143, description: "string of content here", supplier_id: Supplier.first.id}
      assert_response 200
      
      
    

    data = JSON.parse(response.body)
      assert_response 200
      refute_nil data["id"]

    assert_difference "Product.count", 0 do
      post "/products.json",
      headers: {"Authorization" => "Bearer #{@jwt}"}, 
       params: {}
      assert_response 402

      #Asserts that the user can not post a new product UNLESS they are logged in
      post "/products.json"
      assert_response 401
    end
  end


 

  test "update" do
    product = Product.first 
    put "/products/#{product.id}.json",
    headers: {"Authorization" => "Bearer #{@jwt}"}, 
    params: {name: "NEW"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "NEW", data["name"]
    # assert_equal product.total, data["total"]
    assert_equal product.description, data["description"]

    put "/products/#{product.id}.json", 
    headers: {"Authorization" => "Bearer #{@jwt}"}, 
    params: { name: "" }
    assert_response 422
  end


 

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      delete "/products/#{Product.first.id}.json",
        headers: {"Authorization" => "Bearer #{@jwt}"}
      assert_response 200
    end

    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end
end
  

  

  

end
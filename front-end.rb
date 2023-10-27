
require 'http'

response = HTTP.get("http://localhost:3000/products")

products = response.parse 

pp products 
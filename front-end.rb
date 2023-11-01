
require 'http'
require 'tty-table'

response = HTTP.get("http://localhost:3000/products.json")

products = response.parse
rows =[]

products.each do |product|
  row = []
  row << product["name"]
  row << product["price"]
  rows.push(row)
end
 
table = TTY::Table.new(["name","total"], rows)


puts table.render(:ascii)


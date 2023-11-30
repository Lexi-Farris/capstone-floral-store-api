json.id order.id
json.user_id order.user_id
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.products order.products
json.carted_products order.carted_products.map do |carted_product|
  json.id carted_product.id
  json.quantity carted_product.quantity
  json.status carted_product.status
  json.product carted_product.product
end
json.created_at order.created_at
json.updated_at order.updated_at

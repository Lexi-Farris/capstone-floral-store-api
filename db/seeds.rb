# puts "seeding products..."

# Product.create(name: "dahlia", price: 49, image_url:"https://www.edenbrothers.com/cdn/shop/products/dahlia-lindas-baby-1.jpg" ,description:"A beautiful flower to decorate your life. Great for fall")

# Product.create(name: "orchid" ,price: 70 ,image_url: "https://i.etsystatic.com/6077424/r/il/2fc1d3/2144099262/il_794xN.2144099262_gdcp.jpg" , description: "Perfect flower to decorate with in the summer. Low maintaince but doesn't like to flower if you aren't meticilous with its care ")

# puts "seeding complete."

puts "seeding for supplier started"

#! will give us errors if something goes wrong in seeds file 
Supplier.create!(name: "Garden 17",email: "hello@garden17.com", phone_number: "512-123-456")

Supplier.create!(name: "GreenAcres" , email: "hello@GreenAcres.com" , phone_number: "916-123-1233" )

puts "seeding completed without errors"
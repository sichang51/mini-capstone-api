require "http"

puts "Enter the product name:"
product_name = gets.chomp

puts "Enter the price:"
product_price = gets.chomp.to_i

puts "Enter the product description:"
product_description = gets.chomp

# puts "Enter the image url:"
# product_image_url = gets.chomp

# full_product_details = {
#   product_type: product,
#   product_name: name,
#   product_price: price,
#   product_description: description,
#   product_image_url: image_url,
# }

HTTP.post("http://localhost:3000/products.json", :form => { product: product_type, name: product_name, price: product_price, description: product_description })

# , image_url: product_image_url

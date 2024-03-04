
require_relative 'config/environment'

products = Product.all

puts "ID\tTitle\t\t\tDescription\t\t\tPrice\tStock Quantity"

# Print each product
products.each do |product|
  puts "#{product.id}\t#{product.title}\t#{product.description}\t#{product.price}\t#{product.stock_quantity}\t#{product.category.name}"
end

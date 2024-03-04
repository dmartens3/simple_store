# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('products.csv')

CSV.foreach(csv_file, headers: true) do |row|

    category = Category.find_or_create_by(name: row['category'])

    product = {
        title: row['name'],
        price: row['price'].to_f,
        description: row['description'],
        stock_quantity: row['stock quantity'].to_i,
        category: category
    }
    Product.create!(product)
end
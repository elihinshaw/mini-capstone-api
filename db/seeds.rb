# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.new(name: "Desk", price: 125, image_url: "https://unruhfurniture.com/wp-content/uploads/2018/02/Product-Desk-Olivia-Desk-No-Background-1-W1600.png", description: "This is a desk, you can put stuff on it")
product.save

product = Product.new(name: "Chair", price: 35, image_url: "https://assets.stickpng.com/images/580b57fcd9996e24bc43c26d.png", description: "This is a chair, you use it to sit down in a higher location(?)")
product.save

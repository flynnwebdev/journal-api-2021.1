# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

food = Category.create(name: "Food")
coding = Category.create(name: "Coding")

food.entries.create(content: "I love Ice Cream!")
food.entries.create(content: "Breakfast is the most important meal of the day")

coding.entries.create(content: "Coding is Life")
coding.entries.create(content: "React is awesome!")

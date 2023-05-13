# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: "Laura", email: 'laura@gmail.com', password: '1234567890')
second_user = User.create(name: "Malik", email: 'malik@gmail.com', password: '1234567890')
third_user = User.create(name: "Ify", email: 'ify@gmail.com', password: '1234567890')

first_inventory = Inventory.create(name: "First Inventory", user: first_user)
second_inventory = Inventory.create(name: "Second Inventory", user: first_user)
third_inventory = Inventory.create(name: "Third Inventory", user: third_user)
fourth_inventory = Inventory.create(name:"Fourth Inventory", user: second_user)


first_food = Food.create(name: "Apple", measurement_unit:"g", price:52, user: first_user)
second_food = Food.create(name: "Rice", measurement_unit:"g", price:10)
third_food = Food.create(name: "Oat", measurement_unit:"g", price:25)
fourth_food = Food.create(name: "Beans", measurement_unit:"g", price:35)

InventoryFood.create(quantity: 5, inventory_id: first_inventory.id, food_id: first_food.id)
InventoryFood.create(quantity: 10, inventory_id: second_inventory.id, food_id: second_food.id)
InventoryFood.create(quantity: 3, inventory_id: third_inventory.id, food_id: third_food.id)
InventoryFood.create(quantity: 90, inventory_id: first_inventory.id, food_id: fourth_food.id)

InventoryFood.create(quantity: 5, inventory_id: second_inventory.id, food_id: first_food.id)
InventoryFood.create(quantity: 3, inventory_id: second_inventory.id, food_id: second_food.id)
InventoryFood.create(quantity: 6, inventory_id: second_inventory.id, food_id: third_food.id)
InventoryFood.create(quantity: 5, inventory_id: second_inventory.id, food_id: fourth_food.id)

InventoryFood.create(quantity: 5, inventory_id: third_inventory.id, food_id: first_food.id)
InventoryFood.create(quantity: 7, inventory_id: third_inventory.id, food_id: second_food)
InventoryFood.create(quantity: 10, inventory_id: fourth_inventory.id, food_id: third_food.id)
InventoryFood.create(quantity: 5, inventory_id: fourth_inventory.id, food_id: fourth_food.id)

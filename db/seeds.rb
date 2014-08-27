# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create([{ name: 'Hose', description: 'For watering things', price: 14.99 }, { name: 'Toaster', description: 'Bread warming contraption', price: 29.99 }, { name: 'Pillow', description: 'Head thing', price: 9.99 }])
Category.create([{ name: 'Electronics' }, { name: 'Household' }, { name: 'Gardening' }, { name: 'Automotive' }, { name: 'Ninjas' }])
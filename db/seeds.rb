# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
user = User.create(username: "bartenderboss", password: "booze")
jimmy = User.create(username: "JimmyP", password: "pw")

# Cocktails 
martini = Cocktail.create(name: "Dirty Martini")
old_fashioned = Cocktail.create(name: "Old Fashioned")

# Recipes 
my_martini_recipe = Recipe.create(ingredients: "a bunch of stuff", garnish: "olives", notes: "I love this cocktail", user_id: user.id, cocktail_id: martini.id)
jimmy_martini_recipe = Recipe.create(ingredients: "gin, olive juice, vermouth", garnish: "a ton of olives", notes: "You can also use vodka", user_id: jimmy.id, cocktail_id: martini.id)

my_old_fashioned = Recipe.create(ingredients: "some whiskey, simple, bitters", garnish: "one cherry", notes: "My favorite drink", user_id: user.id, cocktail_id: old_fashioned.id)
jimmy_old_fashioned = Recipe.create(ingredients: "rye, simple, orange bitters", garnish: "couple cherries, orange slice", notes: "One big rock or whiskey stone, stirred in rocks glass", user_id: jimmy.id, cocktail_id: old_fashioned.id)
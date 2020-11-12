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
vanessa = User.create(username:"VanessaBartends", password: "password")

# Spirits
vodka = Spirit.create(name: "Vodka")
whiskey = Spirit.create(name: "Whiskey")
rye = Spirit.create(name: "Rye")
gin = Spirit.create(name: "Gin")

# Cocktails 
martini = Cocktail.create(name: "Dirty Martini", spirit_id: vodka.id)
old_fashioned = Cocktail.create(name: "Old Fashioned", spirit_id: whiskey.id)
gin_martini = Cocktail.create(name: "Gin Martini", spirit_id: gin.id)
rye_old_fashioned = Cocktail.create(name: "Old Fashioned", spirit_id: rye.id)

# Recipes 
my_martini_recipe = Recipe.create(name: "Dirty Martini", ingredients: "a bunch of stuff", garnish: "olives", notes: "I love this cocktail", user_id: user.id, cocktail_id: martini.id, spirit_id: vodka.id)
jimmy_martini_recipe = Recipe.create(name: "Dirty Martini", ingredients: "vodka, olive juice, vermouth", garnish: "a ton of olives", notes: "You can also use vodka", user_id: jimmy.id, cocktail_id: martini.id, spirit_id: vodka.id)
vanessa_martini_recipe = Recipe.create(name: "Dirty Martini", ingredients: "2 oz vodka, .75 oz olive juice, splash of vermouth", garnish: "a few olives", notes: "I make this with Grey Goose", user_id: vanessa.id, cocktail_id: martini.id, spirit_id: vodka.id)

my_old_fashioned = Recipe.create(name: "Old Fashioned", ingredients: "some whiskey, simple, bitters", garnish: "one cherry", notes: "My favorite drink", user_id: user.id, cocktail_id: old_fashioned.id, spirit_id: whiskey.id)
jimmy_old_fashioned = Recipe.create(name: "Old Fashioned", ingredients: "rye, simple, orange bitters", garnish: "couple cherries, orange slice", notes: "One big rock or whiskey stone, stirred in rocks glass", user_id: jimmy.id, cocktail_id: rye_old_fashioned.id, spirit_id: rye.id)
vanessa_old_fashioned = Recipe.create(name: "Old Fashioned", ingredients: "2 oz whiskey, .5 oz simple, 4 dashes of bitters", garnish: "one cherry", notes: "My favorite drink, great in the Autumn", user_id: vanessa.id, cocktail_id: old_fashioned.id, spirit_id: whiskey.id)

my_gin_martini = Recipe.create(name: "Dirty Martini", ingredients: "2.5 oz gin, .5 oz olive juice, .5 oz dry vermouth", garnish: "3 skewered olives", notes: "tasty!", user_id: user.id, cocktail_id: gin_martini.id, spirit_id: gin.id)
jimmy_gin_martini = Recipe.create(name: "Dirty Martini", ingredients: "3 oz gin, .5 oz olive juice, .25 oz dry vermouth", garnish: "3 bleu cheese olives", notes: "Gorgonzola baby!", user_id: jimmy.id, cocktail_id: gin_martini.id, spirit_id: gin.id)
# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    # user has_many recipes

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    # recipe belongs to user

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    # user has_many cocktails, through recipes
    # cocktail has_many users, through recipes

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    # ingredients, garnish, notes

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    # user: username; recipe: name, presence: true; spirit: name, presence & uniqueness: true

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    # User model:  :other_users, ->(user) { where.not("id = ?", user.id) }; Path: users/others

- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    # OmniAuth: Google

- [x] Include nested resource show or index (URL e.g. users/2/recipes) 
    # spirits/:spirit_id/recipes

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) #cocktails/1/recipes/new
    # cocktails/:cocktail_id/recipes/new
    
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    # validations logic in views/recipes/_form.html.erb

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
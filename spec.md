# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)

<!-- # Will fulfill this through refactoring recipe create method
# Just explain it and verify that it will suffice
    # user has many cocktails through recipes
    # user submits cocktail name as a recipe name
    # thus, cocktail is found or created dynamically through the recipe name attribute
    # so despite not having a cocktail.name attribute through the new recipe form....
    # the user still submits an attribute and creates a cocktail through the form. -->
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

    <!-- # here I want to add comments and ratings (models) to each recipe
    # then thru a scope method, can show "highest rated recipes"
    # start with rating/voting (look up docs) -->
- [?] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

    <!-- # form_for validation error messages
    # how to do this with redirect_to new_user_recipe_path(current_user)
    # with redirect, errors are erased
            # when render :new; it ignores nested path,
            # so reloading it wont work
        # I do not need the users/:user_id/recipe/new nested route
        # can create recipes at recipes/new and still associate w/      current_user
            # so, remove the nested route users/recipe/new
            # that way you can render :new with the error msgs -->
- [?] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [?] The application is pretty DRY
- [?] Limited logic in controllers
- [?] Views use helper methods if appropriate
- [?] Views use partials if appropriate
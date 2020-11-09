Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

• Logic present in your controllers should be encapsulated as methods in your models.

//

To Do:

- highest_rated_recipes #=> application controller => recipes model class method/scope
- users_from_recipes #=> move to users model
- add a layout (kind of optional, not really)
- add comments functionality (optional)

//

- Do I need to refactor my create/update actions in Recipes Controller? (I think so, it is messy) 
    - create custom setters in cocktail/spirit models (when passing args from recipe_params into setters, find_or_create_by(arg), that way you can use Recipe.create(recipe_params))

//


Models:
User
- username (string)
- password_digest (string)
- has many recipes
- has many cocktails, through recipes

<!-- - has many comments
- has many recipes through comments -->


Cocktail
- name (string)
- has many recipes
- has many users, through recipes
- belongs to spirit

Spirit
- name
- has many cocktails
- has many recipes, through cocktails

Recipe (join table, joining cocktails and users) 
- name (string)
- ingredients (string)
- garnish (string)
- notes (text)
- belongs to user
- belongs to cocktail
- belongs to spirit

<!-- - has many comments
- has many users through comments -->


<!-- Comment? (join table? joining users and recipes)
 - content (text)
 - belongs to user
 - belongs to recipe -->


//
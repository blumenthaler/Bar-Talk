Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

//

To Do:

- add comments functionality (optional)
- add a layout (kind of optional, not really)

- What is the difference between Others view and Users#recipes view?
    - implement this difference, because right now they are very similar

- refactor from start to end point
    - The application is pretty DRY
    - Limited logic in controllers
    - Views use helper methods if appropriate
    - *Views use partials if appropriate*
    - Overall make sure the UI is not convoluted (controller actions => views make sense)
    - remove unused views/controller actions

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
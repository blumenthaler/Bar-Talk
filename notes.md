Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

//

To Do:
- finish voting (optional)
- refactor recipes#edit/update, cleaner code
- verify that my validations for new form are valid(?)
    - using flash instead of logic in view
    - redirects instead of render :new
    - is that^ okay?

//

Voting:
- added basic upvote functionality
- need to change it so:
    - users can vote either up OR down
    - users can only have one vote per recipe
    - users can change their vote on any recipe (from up to down, etc.)

//

- Do my models make sense? Yes
- Do I need to refactor my create/update actions in Recipes Controller? (I think so, it is messy) 
    - create custom setters in cocktail/spirit models (when passing args from recipe_params into setters, find_or_create_by(arg), that way you can use Recipe.create(recipe_params))


- Furthermore, if I delete a Cocktail's (or a Spirit's) final Recipe, can/should/how do I delete that Cocktail/Spirit from the db? Convention? - 
    - Do not have to worry about deleting Cocktails/Spirits from db
    - Just update the views to not display headers if Spirits do not have any cocktails AND if Cocktails do not have any Recipes.

- Validation: User can only have one cocktail recipe of the same name

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

 Nested Route:
- nested new route: new recipe through user
- nested show or index route: unsure
Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

//

- Do my models make sense?
- Should I build my recipes off of the current user or the associated spirit? 

        current_user.recipes.build(recipe_params) 
        OR 
        some_spirit.recipes.build(recipe_params)


- Furthermore, if I delete a Cocktail's (or a Spirit's) final Recipe, can/should/how do I delete that Cocktail/Spirit from the db? Convention?

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
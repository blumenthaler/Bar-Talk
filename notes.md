Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

• Logic present in your controllers should be encapsulated as methods in your models.

//

To Do:

- add a layout (kind of optional, not really)
- add comments functionality (optional)

- add ingredients model

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
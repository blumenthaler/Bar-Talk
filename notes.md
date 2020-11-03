Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

Models:
User
- username (string)
- password_digest (string)
- has many recipes
- has many cocktails, through recipes
- has many comments

Cocktail
- name (string)
- has many recipes
- has many users, through recipes

Recipe
- ingredients (string)
- garnish (string)
- notes (text)
- belongs to user
- belongs to cocktail
- has many comments

Comment?
 - content (text)
 - belongs to user
 - belongs to recipe
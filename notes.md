Bar Talk: A forum for bartenders to discuss cocktail recipes and their variations

Models:
User
- username (string)
- password_digest (string)
- has many recipes
- has many cocktails, through recipes

- has many comments
- has many recipes through comments

Cocktail
- name (string)
- has many recipes
- has many users, through recipes

Recipe (join table, joining cocktails and users) 
- ingredients (string)
- garnish (string)
- notes (text)
- belongs to user
- belongs to cocktail

- has many comments
- has many users through comments


Comment? (join table? joining users and recipes)
 - content (text)
 - belongs to user
 - belongs to recipe
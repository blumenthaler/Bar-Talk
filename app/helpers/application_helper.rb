module ApplicationHelper
    def users_without_current_user(user)
        users = User.all_except(user)
        user_ids = []
        users.each do |u|
            user_ids << u.id
        end
        user_ids
    end

    def recipes_without_current_user(cocktail, user)
        users = users_without_current_user(user)
        recipes = []
        users.each do |id|
            recipes << Recipe.find_by(id: id)
        end
        recipes
    end

    def cocktail_recipes_without_current_user(cocktail, user)
        recipes = recipes_without_current_user(cocktail, user)
        recipe_names = []
        recipes.each do |r|
            recipe_names << r.name
        end
        cocktail_recipes = Recipe.all.map{|r| r.name == cocktail.name }
    end
end

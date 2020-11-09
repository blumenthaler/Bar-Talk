class CocktailsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @cocktails = Cocktail.all
    end

    def others
        @users = users_from_recipes(Recipe.all.all_except_user(current_user))
    end

    def show
        if Cocktail.find_by(id: params[:id]) == nil
            flash[:message] = "This cocktail does not exist"
            redirect_to cocktails_path
        else
            @cocktail = Cocktail.find_by(id: params[:id])
            @user_recipes = @cocktail.recipes.all_by_user(current_user)
            @other_recipes = @cocktail.recipes.all_except_user(current_user)
        end
    end

    def popular 
        @recipes = highest_rated_recipes
    end
end

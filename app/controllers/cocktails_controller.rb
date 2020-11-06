class CocktailsController < ApplicationController

    def index
        # @cocktails = Cocktail.all
        @spirits = Spirit.all
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
end

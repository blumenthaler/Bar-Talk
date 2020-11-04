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
            @user_recipes = @cocktail.recipes.where(user_id: current_user.id)
            @other_recipes = @cocktail.recipes.where.not(user_id: current_user.id)
        end
    end
end

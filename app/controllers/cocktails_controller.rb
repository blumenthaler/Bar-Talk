class CocktailsController < ApplicationController

    def index
        @cocktails = Cocktail.all
    end

    def show
        if Cocktail.find_by(id: params[:id]) == nil
            flash[:message] = "This cocktail does not exist"
            redirect_to cocktails_path
        else
            @cocktail = Cocktail.find_by(id: params[:id])
        end
    end
end

class CocktailsController < ApplicationController
    def show
        @cocktail = Cocktail.find_by(id: params[:id])
    end
end

class CocktailsController < ApplicationController

    def index
        @cocktails = Cocktail.all
    end

    def show
        @cocktail = Cocktail.find_by(id: params[:id])
    end
end

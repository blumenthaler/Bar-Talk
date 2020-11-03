class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = User.find_by(id: session[:user_id])
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name)
        @recipe.save
        redirect_to cocktail_path(@recipe.cocktail)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes)
    end
end

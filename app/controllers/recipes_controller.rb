class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @recipe = Recipe.new(user_id: params[:user_id])
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name) # this can probably be refactored
        @recipe.save
        redirect_to cocktail_path(@recipe.cocktail)
    end

    def edit 
        if params[:user_id]
            @user = current_user
            @recipe = @user.recipes.find_by(id: params[:id])
            redirect_to user_recipes_path(@recipe), flash[:message] = "Recipe not found." if @recipe.nil?
        else
            @post = Post.find(params[:id])
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id)
    end
end

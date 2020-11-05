class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @recipe = Recipe.new(user_id: params[:user_id])
    end

    def create
        @recipe = Recipe.new
        @recipe.name = recipe_params[:name]
        @recipe.ingredients = recipe_params[:ingredients]
        @recipe.garnish = recipe_params[:garnish]
        @recipe.notes = recipe_params[:notes]
        @recipe.spirit = Spirit.find_or_create_by(name: recipe_params[:spirit])
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)
        @recipe.user = current_user
        if @recipe.save
            redirect_to cocktail_path(@recipe.cocktail)
        else
            render new
            flash[:message] = "Recipe creation failed. Please try again."
        end
    end

    def edit 
        if params[:user_id]
            @user = current_user
            @recipe = @user.recipes.find_by(id: params[:id])
            redirect_to user_recipes_path(@recipe), flash[:message] = "Recipe not found." if @recipe.nil?
        else
            @recipe = Recipe.find(params[:id])
        end
    end

    def update
        binding.pry
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.name = recipe_params[:name]
        @recipe.ingredients = recipe_params[:ingredients]
        @recipe.garnish = recipe_params[:garnish]
        @recipe.notes = recipe_params[:notes]
        @recipe.spirit = Spirit.find_or_create_by(name: recipe_params[:spirit])
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)
        @recipe.user = current_user
        @recipe.save
        redirect_to cocktail_path(@recipe.cocktail)
    end

    def destroy
        binding.pry
        @recipe = Recipe.find_by(user_id: params[:user_id])
        @recipe.destroy
        redirect_to users_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id, :spirit)
    end
end

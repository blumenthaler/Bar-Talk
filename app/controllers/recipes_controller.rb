class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    # trying to access all recipes by a user
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @recipes = @user.recipes
        else
    # if it fails, go to all users, set flash
            flash[:message] = "Something is wrong. Try again."
            redirect_to users_path
        end
    end

    def new
        @recipe = Recipe.new(user_id: params[:user_id])
    end

    def create
        @recipe = Recipe.new
        # @recipe = Recipe.new(recipe_params)
        # recipe_params needs correct fields
        @recipe.name = recipe_params[:name]
        @recipe.ingredients = recipe_params[:ingredients]
        @recipe.garnish = recipe_params[:garnish]
        @recipe.notes = recipe_params[:notes]
        # binding.pry
        @recipe.spirit = Spirit.find_or_create_by(name: recipe_params[:spirit_id])
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)
        # binding.pry
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

        @recipe.spirit = Spirit.find_or_create_by(id: recipe_params[:spirit_id])
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
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id, :spirit_id)
    end
end

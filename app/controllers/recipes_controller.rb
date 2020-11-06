class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

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
        if params[:cocktail_id]
            @cocktail = Cocktail.find_by_id(params[:cocktail_id])
        end
    end

    def create
        binding.pry
        @recipe = Recipe.new(recipe_params_without_spirit)
        
        if !recipe_params[:spirit].empty?
            @recipe.spirit_id = Spirit.find_or_create_by(name: recipe_params[:spirit]).id
            @recipe.cocktail_id = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id).id
        end

        @recipe.user = current_user
        
        if @recipe.save
            redirect_to cocktail_path(@recipe.cocktail)
        else
            # is this okay for new form validations?
            errors = ["Recipe was not saved"]
            @recipe.errors.full_messages.each do |msg|
                errors << msg
            end
            errors << "Please try again."
            flash[:message] = errors.join(". ")
            redirect_to new_user_recipe_path(current_user)
        end
    end

    def edit 
        if params[:user_id]
            @user = current_user
            @recipe = @user.recipes.find_by(id: params[:id])
            @cocktail = @recipe.cocktail
            redirect_to user_recipes_path(@recipe), flash[:message] = "Recipe not found." if @recipe.nil?
        else
            @recipe = Recipe.find(params[:id])
            @cocktail = @recipe.cocktail
        end
    end

    def update
        # binding.pry
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.update(recipe_params_without_spirit)
        binding.pry
        if !recipe_params[:spirit].empty? && !recipe_params[:name].empty?
            @recipe.spirit_id = Spirit.find_or_create_by(name: recipe_params[:spirit]).id
            @recipe.cocktail_id = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id).id
        end

        if @recipe.save
            redirect_to cocktail_path(@recipe.cocktail)
        else
            errors = ["Recipe was not updated"]
            @recipe.errors.full_messages.each do |msg|
                errors << msg
            end
            errors << "Please try again."
            flash[:message] = errors.join(". ")
            redirect_to edit_user_recipe_path(current_user)
        end
    end

    def destroy
        binding.pry
        @recipe = Recipe.find_by(user_id: params[:user_id])
        @recipe.destroy
        redirect_to user_recipes_path(current_user)
    end

    def upvote
        # binding.pry
        @recipe = Recipe.find(params[:id])
        @recipe.votes.create
        redirect_to cocktail_path(@recipe.cocktail)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id, :spirit_name)
    end

    def recipe_params_without_spirit
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes)
    end
end

class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :current_recipe, only: [:show, :upvote, :downvote, :edit, :update, :destroy]

    def index
        if params[:cocktail_id]
            redirect_to cocktail_path(params[:cocktail_id])
        elsif params[:spirit_id] && @spirit = Spirit.find_by_id(params[:spirit_id])
            @recipes = @spirit.recipes
        else
            @error = "This spirit does not exist." if params[:spirit_id]
            @recipes = Recipe.all 
        end
    end

    def show
        redirect_to cocktail_path(@recipe.cocktail)
    end

    def new
        if params[:cocktail_id] && @cocktail = Cocktail.find_by_id(params[:cocktail_id])
            @recipe = @cocktail.recipes.build
        else
            @error = "This cocktail does not exist." if params[:cocktail_id]
            @cocktail = Cocktail.new
            @recipe = Recipe.new
        end
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)
        @recipe.user = current_user
        if @recipe.save
            @cocktail = @recipe.cocktail
            flash[:success] = "Recipe Created!"
            redirect_to cocktail_path(@recipe.cocktail)
        else
            if params[:cocktail_id] != nil
                @cocktail = Cocktail.find_by_id(params[:cocktail_id])
            else
                @cocktail = Cocktail.new
            end
            render :new
        end
    end

    def edit 
        if authorized_to_edit_or_delete?(@recipe)
            redirect_to user_recipes_path(@recipe), flash[:message] = "Recipe not found." if @recipe.nil?
        else
            flash[:message] = "You are not authorized to edit this recipe."
            redirect_to cocktail_path(@recipe.cocktail)
        end
    end

    def update
        if @recipe.update(recipe_params)
            flash[:success] = "Recipe updated!"
            redirect_to cocktail_path(@recipe.cocktail)
        else
            render :edit
        end
    end

    def destroy
        if authorized_to_edit_or_delete?(@recipe)
            @recipe.destroy
            flash[:success] = "Recipe deleted."
            redirect_to user_path(current_user)
        else
            flash[:message] = "You are not authorized to delete this recipe."
            redirect_to cocktail_path(@recipe.cocktail)
        end
    end

    def upvote
        @recipe.upvote_by current_user
        flash[:success] = "You liked #{@recipe.user.username}'s #{@recipe.name} recipe."
        redirect_to cocktail_path(@recipe.cocktail)
    end

    def downvote
        @recipe.downvote_by current_user
        flash[:success] = "You disliked #{@recipe.user.username}'s #{@recipe.name} recipe."
        redirect_to cocktail_path(@recipe.cocktail)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id, :spirit_name)
    end

    def current_recipe
        @recipe = Recipe.find(params[:id])
    end
end

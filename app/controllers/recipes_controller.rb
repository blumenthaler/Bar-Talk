class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :current_recipe, only: [:upvote, :downvote, :update, :destroy]

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @recipes = @user.recipes
        else
            @error = "This user does not exist." if params[:user_id]
            @recipes = Recipe.all
        end
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
        # cannot mass assign cocktail
        # cocktail name is the same as recipe name
        # therefore there is only field for name (as in recipe[:name]), not cocktail
        # is this okay?
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)
        @recipe.user = current_user
        if @recipe.save
            @cocktail = @recipe.cocktail
            flash[:success] = "Recipe Created!"
            redirect_to cocktail_path(@recipe.cocktail)
        else
            # is this okay for new form validations requirement?
            errors = ["Recipe was not saved"]
            @recipe.errors.full_messages.each{ |msg| errors << msg }
            errors << "Please try again."
            @error = errors.join(". ")
            if params[:cocktail_id] != nil
                @cocktail = Cocktail.find_by_id(params[:cocktail_id])
            else
                @cocktail = Cocktail.new
            end
            render :new
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
        if recipe_params[:ingredients].empty?
            @error = "Recipe was not updated. Ingredients cannot be empty. Please try again."
            render :edit
        else
            @recipe.update(recipe_params)
            flash[:success] = "Recipe updated!"
            redirect_to cocktail_path(@recipe.cocktail)
        end

    end

    def destroy
        @recipe.destroy
        flash[:success] = "Recipe deleted."
        redirect_to user_recipes_path(current_user)
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

    def req_recipe_params
        params.require(:recipe).permit(:name, :ingredients, :spirit_name)
    end

    def current_recipe
        @recipe = Recipe.find(params[:id])
    end
end

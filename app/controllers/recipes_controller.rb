class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @recipes = @user.recipes
        else
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
        @recipe = Recipe.new(recipe_params)
        # cannot mass assign cocktail
        # cocktail name is the same as recipe name
        # therefore there is only field for name (as in recipe[:name]), not cocktail
        @recipe.cocktail = Cocktail.find_or_create_by(name: @recipe.name, spirit_id: @recipe.spirit.id)

        @recipe.user = current_user
        if @recipe.save
            redirect_to cocktail_path(@recipe.cocktail)
        else
            # is this okay for new form validations requirement?
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
        @recipe = Recipe.find_by(id: params[:id])
        if req_recipe_params.values.any?{|i|i.empty?}
            flash[:message] = "Recipe was not updated. Name, spirit, and ingredients cannot be empty. Please try again."
            redirect_to edit_recipe_path(@recipe)
        else
            flash[:success] = "Recipe updated!"
            @recipe.update(recipe_params)
            redirect_to cocktail_path(@recipe.cocktail)
        end

    end

    def destroy
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.destroy
        flash[:success] = "Recipe deleted."
        redirect_to user_recipes_path(current_user)
    end

    def upvote
        @recipe = Recipe.find(params[:id])
        @recipe.upvote_by current_user
        flash[:success] = "You liked this recipe."
        redirect_to cocktail_path(@recipe.cocktail)
    end

    def downvote
        @recipe = Recipe.find(params[:id])
        @recipe.downvote_by current_user
        flash[:success] = "You disliked this recipe."
        redirect_to cocktail_path(@recipe.cocktail)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :garnish, :notes, :user_id, :spirit_name)
    end

    def req_recipe_params
        params.require(:recipe).permit(:name, :ingredients, :spirit_name)
    end

end

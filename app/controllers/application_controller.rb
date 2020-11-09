class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :authorized_to_edit_or_delete?, :highest_rated_recipes, :pluralize_without_count
    include ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

    def authorized_to_edit_or_delete?(recipe)
        recipe.user == current_user
    end

    # recipes model class method/scope
    def highest_rated_recipes
        recipes = Recipe.all.each.sort_by{|r| r.get_likes.size}.reverse
        top_three = [recipes[0], recipes[1], recipes[2]]
        top_three
    end

    # users model
    def users_from_recipes(recipes_array)
        recipes_array.map{|recipe| recipe.user}.uniq
    end
end

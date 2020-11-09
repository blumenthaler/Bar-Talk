class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
    end

        # does this belong in the model? or can it live here? refactor as helper method?
    def highest_rated_recipes
        recipes = Recipe.all.each.sort_by{|r| r.get_likes.size}
        top_three = [recipes[0], recipes[1], recipes[2]]
        top_three
    end
end

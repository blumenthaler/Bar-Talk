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
end

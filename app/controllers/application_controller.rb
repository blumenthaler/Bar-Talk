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

    def users_without_current_user
        @users = User.all_except(current_user)
        user_ids = []
        @users.each do |u|
            user_ids << u.id
        end
        user_ids
    end

    def recipes_without_current_user
        recipes = []
        users_without_current_user.each do |id|
            recipes << Recipe.find_by(user_id: id)
        end
        recipes
    end
end

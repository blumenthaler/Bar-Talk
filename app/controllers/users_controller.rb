class UsersController < ApplicationController

    #do I want to get rid of Users#index? seems redundant (recipes#others)
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        @recipes = @user.recipes
        redirect_to user_recipes_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

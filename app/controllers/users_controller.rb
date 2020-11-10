class UsersController < ApplicationController

    def others
        @users = User.other_users(current_user)
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
        if @user = User.find_by(id: params[:id])
            @recipes = @user.recipes
        else
            flash[:message] = "This user does not exist."
            redirect_to recipes_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

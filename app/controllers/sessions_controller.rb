class SessionsController < ApplicationController

    def index
        render :welcome
    end

    def new
        #add helper method; if logged in, redirect to user show
        render :login
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid Username/Password"
            redirect_to login_path
        end 
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end
class SessionsController < ApplicationController

    def index
        render :welcome
    end

    def new
        if logged_in?
            redirect_to user_path(current_user)
        else
            render :login
        end
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

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
end
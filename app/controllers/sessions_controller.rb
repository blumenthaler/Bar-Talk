class SessionsController < ApplicationController

    def index
        render :welcome
    end

    def new
        #add helper method; if logged in, redirect to user show
        render :login
    end

    def create
    end
end
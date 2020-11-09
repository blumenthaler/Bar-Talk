class SpiritsController < ApplicationController

    def index
        redirect_to cocktails_path
    end

    def show
        redirect_to spirit_recipes_path(params[:id])
    end
end
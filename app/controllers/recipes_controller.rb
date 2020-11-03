class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @recipe = Recipe.new
    end

    def create
    end
end

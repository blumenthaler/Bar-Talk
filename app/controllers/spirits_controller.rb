class SpiritsController < ApplicationController
    
    def index
        redirect_to cocktails_path
    end

    def show
        redirect_to spirit_recipes_path(params[:id])
    end

    def search
        @input = search_params[:Search].capitalize
        @spirit = Spirit.find_by(name: @input)
        if !@spirit
            splitted = @input.split(%r{\s*})
            first_three = splitted.values_at(0, 1, 2)
            mod_input = first_three.join
            Spirit.all.each do |spirit|
                split_spirit = spirit.name.split(%r{\s*})
                spirit_three = split_spirit.values_at(0, 1, 2)
                mod_spirit = spirit_three.join
                if mod_spirit == mod_input
                    flash[:message] = "No Spirit matches that name. Did you mean #{spirit.name}?"
                end
            end
        end
    end

    private

    def search_params
        params.permit(:Search)
    end
end
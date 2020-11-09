class Cocktail < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :users, through: :recipes
    belongs_to :spirit
end

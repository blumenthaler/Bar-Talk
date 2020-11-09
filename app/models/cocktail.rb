class Cocktail < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_many :users, through: :recipes
    # validates :name, presence: true
    belongs_to :spirit
end

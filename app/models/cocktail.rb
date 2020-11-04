class Cocktail < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
    validates :name, presence: true
    belongs_to :spirit
end

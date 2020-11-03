class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  validates :ingredients, presence: true
end

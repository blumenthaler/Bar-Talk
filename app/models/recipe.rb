class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  validates :ingredients, presence: true
  accepts_nested_attributes_for :spirits
end

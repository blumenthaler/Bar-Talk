class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  validates :ingredients, presence: true
  has_many :votes, dependent: :destroy
end

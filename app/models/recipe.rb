class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  validates :ingredients, presence: true
  has_many :votes, dependent: :destroy
  scope :all_except_user, ->(user) { where.not("user_id = ?", user.id) }
  scope :all_by_user, ->(user) { where("user_id = ?", user.id) }
end

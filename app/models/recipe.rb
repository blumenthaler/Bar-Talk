class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  accepts_nested_attributes_for :cocktail
  validates :name, presence: true
  validates :ingredients, presence: true
  scope :all_except_user, ->(user) { where.not("user_id = ?", user.id) }	
  scope :all_by_user, ->(user) { where("user_id = ?", user.id) }

  def spirit_name=(name)
    self.spirit = Spirit.find_or_create_by(name: name)
  end

  def spirit_name
    self.spirit ? self.spirit.name : nil
  end

  def self.highest_rated_recipes
    recipes = self.all.sort_by{|r| r.get_likes.size}.reverse
    top_three = [recipes[0], recipes[1], recipes[2]]
    top_three
  end
end
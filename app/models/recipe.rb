class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  accepts_nested_attributes_for :cocktail
  validates :name, presence: true
  validates :ingredients, presence: true

  def spirit_name=(name)
    self.spirit = Spirit.find_or_create_by(name: name)
  end

  def spirit_name
    self.spirit ? self.spirit.name : nil
  end
end
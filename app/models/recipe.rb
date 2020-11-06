class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  belongs_to :spirit
  validates :ingredients, presence: true
  has_many :votes, dependent: :destroy
  scope :all_except_user, ->(user) { where.not("user_id = ?", user.id) }
  scope :all_by_user, ->(user) { where("user_id = ?", user.id) }

  def spirit_name=(name)
    self.spirit = Spirit.find_or_create_by(name: name)
  end

  def spirit_name
    self.spirit ? self.spirit.name : nil
  end
end
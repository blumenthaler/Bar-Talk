class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    # has_many :recipied_cocktails, through: :recipes, source: :cocktail
    validates :username, presence: true
    has_secure_password
    scope :all_except, ->(user) { where.not(id: user) }
end
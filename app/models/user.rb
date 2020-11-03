class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    # has_many :recipied_cocktails, through: :recipes, source: :cocktail
    has_secure_password
end

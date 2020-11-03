class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
end

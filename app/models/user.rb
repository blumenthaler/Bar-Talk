class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    has_secure_password
end

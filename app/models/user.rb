class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    # has_many :recipied_cocktails, through: :recipes, source: :cocktail
    validates :username, presence: true
    has_secure_password


    def self.from_omniauth(auth)
        binding.pry
        where(username: auth.info.name).first_or_initialize do |user|
          user.username = auth.info.name
          user.password = SecureRandom.hex
        end
    end
end
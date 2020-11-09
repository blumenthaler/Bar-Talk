class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    validates :username, presence: true
    has_secure_password
    acts_as_voter

    def self.from_omniauth(auth)
        where(username: auth.info.name).first_or_initialize do |user|
          user.username = auth.info.name
          user.password = SecureRandom.hex
        end
    end
end
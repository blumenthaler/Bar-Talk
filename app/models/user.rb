class User < ApplicationRecord
    has_many :recipes
    has_many :cocktails, through: :recipes
    validates :username, presence: true
    has_secure_password
    scope :other_users, ->(user) { where.not("id = ?", user.id) }
    acts_as_voter

    def self.from_omniauth(auth)
        where(username: auth.info.name).first_or_initialize do |user|
          user.username = auth.info.name
          user.password = SecureRandom.hex
        end
    end

    def self.users_from_recipes(recipes_array)
        recipes_array.map{|recipe| recipe.user}.uniq
    end
end
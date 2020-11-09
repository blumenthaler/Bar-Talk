class Spirit < ApplicationRecord
    has_many :cocktails, dependent: :destroy
    has_many :recipes
    validates :name, presence: true, uniqueness: true
end

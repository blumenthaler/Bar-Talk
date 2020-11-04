class Spirit < ApplicationRecord
    has_many :cocktails
    validates :name, presence: true, uniqueness: true
end

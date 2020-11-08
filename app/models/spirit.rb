class Spirit < ApplicationRecord
    has_many :cocktails, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end

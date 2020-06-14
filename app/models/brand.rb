class Brand < ApplicationRecord
    has_many :sneakers
    has_many :users, through: :sneakers

    validates :name, uniqueness: true, presence: true
end

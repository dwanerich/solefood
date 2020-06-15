class Brand < ApplicationRecord
    has_many :sneakers
    has_many :users, through: :sneakers

    validates :name, presence: true, uniqueness: true
    scope :alphabetize, -> {order(name: :asc)}

end

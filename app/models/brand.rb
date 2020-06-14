class Brand < ApplicationRecord
    has_many :sneakers
    has_many :users, through: :sneakers

    validates :name, uniqueness: true

    scope :alphabetize, -> {order(name: :asc)}

end

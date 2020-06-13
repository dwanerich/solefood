class Brand < ApplicationRecord
    has_many :sneakers
    belongs_to :sneaker
    has_many :users, through: sneakers
end

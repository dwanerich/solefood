class Sneaker < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    has_many :comments
end

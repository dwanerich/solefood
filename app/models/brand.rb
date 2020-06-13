class Brand < ApplicationRecord
    has_many :sneakers
    has_many :users, through: :sneakers

end

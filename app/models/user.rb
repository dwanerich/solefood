class User < ApplicationRecord
    has_many :sneakers
    has_many :brands through: :sneakers
    
end

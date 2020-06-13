class User < ApplicationRecord
    has_many :sneakers
    has_many :brands, through: :sneakers

    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    has_secure_password
    
end

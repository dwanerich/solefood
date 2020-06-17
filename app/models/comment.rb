class Comment < ApplicationRecord
    belongs_to :sneaker
    validates :description, presence: { message: "Cant' be empty"}
    validates_presence_of :description
    
end

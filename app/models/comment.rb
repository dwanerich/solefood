class Comment < ApplicationRecord
    belongs_to :sneaker

    validates_presence_of :description
    
end

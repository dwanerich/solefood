class Sneaker < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    has_many :comments
    validates_presence_of :name
    accepts_nested_attributes_for :brand
    accepts_nested_attributes_for :comments
    scope :most_comments, -> {joins(:comments).group(:sneaker_id).order("COUNT(comments.sneaker_id) DESC")}


end

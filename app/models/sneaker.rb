class Sneaker < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    has_many :comments
    validates_presence_of :name
    accepts_nested_attributes_for :brand
    accepts_nested_attributes_for :comments



    


    # def brand
    # end

    # def brand=
    # end

    # def build_brand
    # end

    # def brand_id
    #     @sneaker.brand.id
    # end

    # def brand_id=
    # end
end

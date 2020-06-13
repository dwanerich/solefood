class Sneaker < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    has_many :comments
    accepts_nested_attributes for :brand



    def brand
    end

    def brand=
    end

    def build_brand
    end

    def brand_id
    end

    def brand_id=
    end
end

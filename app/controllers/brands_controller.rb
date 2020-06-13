class BrandsController < ApplicationController

    def new
        @brand = Brand.new
    end

    def index
        @brands = Brand.all
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brands_path
        else
            render :new
        end
    end


        private

        def brand_params

            params.require(:brand).permit(:name)
        end
end

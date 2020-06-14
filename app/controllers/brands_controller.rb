class BrandsController < ApplicationController
    before_action :require_login


    def new
        if params[:sneaker_id]
        @sneaker = Sneaker.new
        @sneaker = Sneaker.find_by(id: params[:sneaker_id])
        @brand.sneakers << @sneaker

        else
            @brand = Brand.new
        end
    end

    def index
        @brands = Brand.all
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
            render :new
        end
    end

    def show
        @brand = Brand.find_by(id: params[:id])
    end


        private

        def brand_params

            params.require(:brand).permit(:name)
        end
end

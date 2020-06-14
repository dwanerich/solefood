class SneakersController < ApplicationController

    def index
        @sneakers = Sneaker.all
        
    end

    def new
        @sneaker = Sneaker.new
        @sneaker.build_brand
    end

    def create
          binding.pry
        @sneaker = Sneaker.new(sneaker_params)
        @sneaker.user_id = session[:user_id]

        if @sneaker.save
            redirect_to sneakers_path(@sneaker)
        else
            render :new
        end
    end

    def show
        @sneaker = Sneaker.find(params[:id])
    end

        private

        def sneaker_params

            params.require(:sneaker).permit(:name, :size, :price, :user_id, :brand_id, brand_attributes: [:name])

        end

end

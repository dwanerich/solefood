class SneakersController < ApplicationController

    def index
        @sneakers = Sneaker.all
        
    end

    def new
        @sneaker = Sneaker.new
        @sneaker.build_brand
    end

    def create
        @sneaker = Sneaker.new(sneaker_params)
        @sneaker.user_id = session[:user_id]

        if @sneaker.save
            redirect_to sneakers_path(@sneaker)
        else
            render :new
        end
    end

    def show
        @sneaker = Sneaker.find_by_id(params[:id])
        redirect_to '/' if !@sneaker
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
    end

    def update

        @sneaker = Sneaker.find_by(id: params[:id])
        @sneaker.update(sneaker_params)
        if @sneaker.valid?
        redirect_to sneaker_path(@sneaker)
        else
        render :edit
        end
    end

    def destroy
        sneaker = Sneaker.find_by(id: params[:id])
        sneaker.delete
        redirect_to sneakers_path
    end

    end

        private

        def sneaker_params

            params.require(:sneaker).permit(:name, :size, :price, :user_id, :brand_id, brand_attributes: [:name])

        end

end

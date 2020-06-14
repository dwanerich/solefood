class SneakersController < ApplicationController

    before_action :require_login


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
            redirect_to users_path(@user)
        else
            render :new
        end
    end

    def show
        @sneaker = Sneaker.find_by_id(params[:id])
        redirect_to '/' if !@sneaker
    end

    def edit
        @sneaker = Sneaker.find_by(id: params[:id])
    end

    def update

        @sneaker = Sneaker.find_by(id: params[:id])
        @sneaker.update(sneaker_params)
        if @sneaker.valid?
        redirect_to user_path
        else
        render :edit
        end
    end

    def destroy
        sneaker = Sneaker.find_by(id: params[:id])
        sneaker.delete
        redirect_to sneakers_path
    end

        private

        def sneaker_params

            params.require(:sneaker).permit(:name, :size, :price, :user_id, :brand_id, brand_attributes: [:name])

        end

end

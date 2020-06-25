class SneakersController < ApplicationController

    before_action :require_login


    def index
        
        if params[:brand_id]
            @brand = Brand.find(params[:brand_id])
            @sneakers = @brand.sneakers

        else
            @sneakers = Sneaker.all
        end
    
    end

    def new
        @user = User.find_by(id: params[:id])
        @sneaker = Sneaker.new
        @sneaker.build_brand
    end

    def create
        @user = User.find_by(id: params[:id])
        @sneaker = Sneaker.new(sneaker_params)
        @sneaker.user_id = session[:user_id]
        if params[:sneaker][:brand_id]
            @sneaker.brand_id = params[:sneaker][:brand_id]
        end

            if @sneaker.save
                redirect_to user_path(current_user)
            else
                render :new
            end
    end

    def show
        @comment = Comment.new
        @sneaker = Sneaker.find_by(id: params[:id])
        @brands = Brand.find_by(id: params[:id])
    end

    def edit
        @sneaker = Sneaker.find_by(id: params[:id])
        if session[:user_id] != @sneaker.user_id
            redirect_to user_path(session[:user_id])
        end 
    end

    def update
        @sneaker = Sneaker.find_by(id: params[:id])
        if @sneaker && @sneaker.user == Helpers.current_user(session)
            @sneaker.update(sneaker_params)
            redirect_to user_path(session[:user_id])
        else
            render :edit
        end
    end

    def destroy
        @sneaker = Sneaker.find_by(id: params[:id])
        if @sneaker && @sneaker.user == Helpers.current_user(session)
            @sneaker.delete
        end
        redirect_to sneakers_path
    end

        private

        def sneaker_params

            params.require(:sneaker).permit(:name, :size, :price, :user_id, :brand_id, brand_attributes: [:name])

        end

end

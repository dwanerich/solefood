class UsersController < ApplicationController
        before_action :require_login, except: [:new, :create]


    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if params[:id]
            @user = User.find_by_id(params[:id])
        else
            @user = User.find_by_id(session[:user_id])
        end
        redirect_to '/' if !@user
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user && @user == Helpers.current_user(session)
            @user.delete
        end
        redirect_to '/'
    end


        private

        def user_params

            params.require(:user).permit(:username, :password, :password_confirmation)

        end



end

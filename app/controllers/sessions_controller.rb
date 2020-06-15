class SessionsController < ApplicationController

    def welcome
    end

    def new
        if current_user
            current_user
        end
    end

    def fb_create
        @user = User.find_or_create_by(id: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = '12345'
        end

        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end


    def create
        @user = User.find_by(username: params[:user][:username])
            if @user.try(:authenticate ,params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            
            flash[:error] = "sorry try again, incorrect login info, Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

        def auth
            request.env['omniauth.auth']
        end

end
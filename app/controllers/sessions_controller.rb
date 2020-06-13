class SessionsController < ApplicationController

    def welcome
    end

    def new
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

#     def create
#     @user = User.find_or_create_by(uid: auth['uid']) do |u|
#       u.name = auth['info']['name']
#       u.email = auth['info']['email']
#       u.image = auth['info']['image']
#     end

#     session[:user_id] = @user.id

#     render 'welcome/home'
#   end

  private

  def auth
    request.env['omniauth.auth']
  end

end
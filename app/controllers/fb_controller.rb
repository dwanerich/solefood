class FbController < ApplicationController

    def new
    end

    def create
    @user = User.find_or_create_by(id: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = '12345'
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
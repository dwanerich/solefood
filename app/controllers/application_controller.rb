class ApplicationController < ActionController::Base

    def about
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

  def is_logged_in?(session)
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])  
  end
    
    def require_login
        if current_user

        else
            redirect_to '/'
        end
    end
  
end

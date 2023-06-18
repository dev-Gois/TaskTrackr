class ApplicationController < ActionController::Base
    def authenticate_user!
      if session[:user_id]
        user = User.find_by(id: session[:user_id])
        if user.nil?
          reset_session
          redirect_to login_path, alert: "Your user session is no longer valid. Please log in again."
        end
      else
        redirect_to login_path, alert: "You must be logged in."
      end
    end
  end
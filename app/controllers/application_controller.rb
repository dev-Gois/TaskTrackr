class ApplicationController < ActionController::Base

    def authenticate_user!
        unless session[:user_id]
            redirect_to login_path, alert: "You must be logged in."
        end
    end
end

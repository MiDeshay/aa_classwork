class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    protect_from_forgery 
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        @current_user.reset_session_token! if logged_in?
        @current_user = nil
        session[:session_token] = nil
    end

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
        
    end
end

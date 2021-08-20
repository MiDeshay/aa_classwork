class SessionsController < ApplicationController

    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def create
        username = params[:user][:username]
        password = params[:user][:password]
        user = User.find_by_credentials(username, password)
            if user
                login(user)
                redirect_to user_url(user)
            else
                flash[:errors] = user.errors.full_messages
                redirect_to new_session_url
            end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end

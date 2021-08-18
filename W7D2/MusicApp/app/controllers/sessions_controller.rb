class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end
    
    def create

        email = params[:user][:email]
        password = params[:user][:password]

        @user = User.find_by_credentails(email, password)

        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
       
    end

    def destroy
        logout!
        redirect_to users_url
    end
end

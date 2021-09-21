class Api::SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil? 
            flash.now [:errors] = ["Invalid Username or Password"]
        else 
            login!(@user)
            redirect_to user_url(@user)
        end
    end

    def destroy
        if logged_in?
            logout!
            render json
        else 
            flash.now [:errors] = ["Error 404, user not found"]
        end
    end

end

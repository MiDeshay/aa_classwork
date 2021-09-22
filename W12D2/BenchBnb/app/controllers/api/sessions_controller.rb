require 'active_support/core_ext'

class Api::SessionsController < ApplicationController

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil? 
            render json: ['Nope. Wrong credentials!'], status: 401
        else 
            login!(@user)
            redirect_to api_user_url(@user)
        end
    end

    def destroy
        if logged_in?
            logout!
            render json: {}
        else 
            render json: @user.errors.full_messages, status: 404
        end
    end

end

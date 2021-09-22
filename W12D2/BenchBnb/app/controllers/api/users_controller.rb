class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
    def create
        @user = User.new(user_params)
        if @user.save
          login!(@user)
          redirect_to api_user_url(@user)
        else
          # Tell the user that something went wrong. Let them try again.
          render json: @user.errors.full_messages
       
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
          render :show
        else
          render json: @user.errors.full_messages, status: 404
        end
      end
    

private

  def user_params
    # params.require(:user).permit(:username, :email)
    # Add password
    params.require(:user).permit(:username, :email, :password)
  end
end

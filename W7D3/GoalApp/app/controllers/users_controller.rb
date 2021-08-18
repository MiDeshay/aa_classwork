class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.find_by_credentials(params[:username], params[:password])
    if @user
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  # private
  # def user
end

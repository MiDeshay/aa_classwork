class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def new
        @user = User.new
        render :new
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def create
        @user = User.new(user_params)
        if @user.save!  
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user 
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to users_url
        end
    end

    def update
        @user = User.find_by_credentials(user_params)
        if @user.update
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end

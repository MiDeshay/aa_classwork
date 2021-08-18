class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def index
        @users = User.all
        render :index
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end


    def update
        @user = User.update(user_params)
        if @user
            render user_url(@user)
        else
            render :edit
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            redirect_to users_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

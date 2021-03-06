class UsersController < ApplicationController

    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: unprocessable_entity
        end
    end

    # def new
    # end

    def show
        render json: User.find()
    end

    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.destroy
            redirect_to users_url(user)
        else
            render json: "Didn't work"
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end
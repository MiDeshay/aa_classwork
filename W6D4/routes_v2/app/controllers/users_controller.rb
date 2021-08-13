class UsersController < ApplicationController

    def index
        # users can search for other users by name
        # check if a query is present in the request params.
        @user = User.all
        if params.has_key?("username")
            @user = User.where(username: params[:username])
        end
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
        @user = User.find_by(id: params[:id])
        render json: @user
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
            render json: user.errors.full_messages, status: unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end

end
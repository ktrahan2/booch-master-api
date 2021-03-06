class UsersController < ApplicationController
    
    def index
        @users = User.all

        render json: UserSerializer.new(@users)
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user
        else
            render json: {message: @user.errors.full_messages}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "#{@user.username} was deleted"}
    end

    private 

    def user_params 
        params.require(:user).permit([:username, :password_digest, :email])
    end

end

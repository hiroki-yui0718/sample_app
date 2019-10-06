class UsersController < ApplicationController
    def index
        @user = User.all
    end
    def show
        @users = User.find(params[:id])
    end
    def new
        @user =User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user,notice:"Welcome to the Sample App!"
        else 
            render 'new'
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
        else
            render 'edit'
        end
    end


    private def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :password_confirmation
            )
    end
end

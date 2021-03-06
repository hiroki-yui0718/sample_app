class UsersController < ApplicationController
    def index
        @users = User.paginate(page: params[:page],:per_page => 5)
    end
    def show
        @user = User.find(params[:id])
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
    def destroy
        User.find(params[:id]).destroy
        redirect_to users_url,notice:"User deleted"
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

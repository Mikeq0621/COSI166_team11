class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @transactions = @user.transactions
    end

    def new
        @user = User.new
    end
     
    def create
        @user = User.new(user_params)    
        if @user.save
            log_in @user
            flash[:success] = "Welcome to AirStorage!"
            redirect_to root_path
        else
            render 'new'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation)
        end
end

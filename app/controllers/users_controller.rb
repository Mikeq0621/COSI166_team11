class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :update]

    def index
        @users = User.all
    end

    def show
        if params[:id]
            @user = User.find(params[:id])
        else
            @user = current_user
        end
        @transactions = @user.transactions
        @requests = @user.requests
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
    def update
        @user = User.find_by(email: (params[:email]))
        if params[:user][:password].empty?                  # No password entered
            @user.errors.add(:password, "can't be empty")
            render 'edit'
          elsif @user.update(params.require(:user).permit(:password, :password_confirmation)) # Success reset
            reset_session
            log_in @user
            flash[:success] = "Password has been reset."
            redirect_to @user
          else
            render 'edit'                                     # Fail to reset
          end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :phone_number, :password, 
                                        :password_confirmation, :address, :city, :state, :zip_code)
        end
end

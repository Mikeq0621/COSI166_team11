class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

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
        @notifications = @user.notifications
    end

    def new
        @user = User.new
    end
     
    def edit
        if params[:id]
            @user = User.find(params[:id])
          else
            @user = current_user
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params) 
        if @user.update(user_params)
            host_log_in @user
            flash[:success] = "Edit Succesfull!"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end
    def create
        @user = User.new(user_params)    
        if @user.save
            log_in @user
            flash[:success] = "Welcome to AirStorage!"
            #UserMailer.with(user:@user).welcome.deliver_now
            redirect_to root_path
        else
            render 'new'
        end
    end

    def send_email
        UserMailer.with(user: current_user).welcome.deliver_now
    end
    private
        def user_params
            params.require(:user).permit(:name, :email, :phone_number, :password, 
                                        :password_confirmation, :address, :city, :state, :zip_code)
        end
end

class HostsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def index
        @hosts = Host.all
    end

    def show
        if params[:id]
            @host = Host.find(params[:id])
          else
            @host = current_host
          end
        @listings = @host.listings
        @requests = @host.requests
        @transactions = @host.transactions
        @notifications = @host.notifications
    end

    def new
        @host = Host.new
    end

    def edit
        if params[:id]
            @host = Host.find(params[:id])
          else
            @host = current_host
        end
    end

    def update
        @host = Host.find(params[:id])
        @host.update(user_params) 
        if @host.update(user_params)
            host_log_in @host
            flash[:success] = "Edit Succesfull!"
            redirect_to host_path(@host)
        else
            render 'edit'
        end
    end
     
    def create
        @host = Host.new(user_params)    
        if @host.save
            host_log_in @host
            flash[:success] = "Welcome to AirStorage (Host mode)!"
            HostMailer.welcome(@host).deliver_now
            redirect_to root_path
        else
            render 'new'
        end
    end

    def read_notification
        user = Host.find(params[:user_id])
        user.notifications.mark_as_read!
        redirect_to user
    end

    def send_message
        user = current_user
        host = Host.find(params[:host_id])
        message = params[:message]
        HostMailer.user_message(user,host,message).deliver_now
        redirect_to user
    end
    private
    def user_params
        params.require(:host).permit(:name, :email, :phone_number, :password, 
                                    :password_confirmation, :address, :city, :state, :zip_code)
    end

end

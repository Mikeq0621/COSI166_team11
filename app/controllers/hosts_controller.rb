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
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:host).permit(:name, :email, :phone_number, :password, 
                                    :password_confirmation, :address, :city, :state, :zip_code)
    end

end

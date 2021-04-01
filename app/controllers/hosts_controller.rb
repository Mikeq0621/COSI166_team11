class HostsController < ApplicationController

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

class HostsController < ApplicationController

    def index
        @hosts = Host.all
    end

    def show
        @host = Host.find(params[:id])
        @listings = @host.listings
        @transactions = @host.transactions
    end

end

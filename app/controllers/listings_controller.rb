class ListingsController < ApplicationController

    def index
        @listings = Listing.all
        #@listings_names 
    end

    def new
        @listing = Listing.new
        @weeks = (1..10).to_a
    end
    def create

    end

    def show
        @listing = Listing.find(params[:id])
        @host = Host.find(@listing.host_id)
    end
end

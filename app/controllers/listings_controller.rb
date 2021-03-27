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
        h_id = current_host.id
        dur = params[:listing][:duration].to_i
        
        @listing = Listing.new(host_id:h_id,space:params[:listing][:space],duration:dur)
        if @listing.save
            redirect_to Host.find(h_id)
        else
            render 'new'
        end
    end

    def show
        @listing = Listing.find(params[:id])
        @host = Host.find(@listing.host_id)
    end

    def destroy
        listing = Listing.find(params[:id])
        host = Host.find(listing.host_id)
        listing.destroy
        redirect_to host
    end
    
    
end

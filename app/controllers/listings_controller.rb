class ListingsController < ApplicationController

    def index
        @listings = Listing.all
        json_hash = {:type => 'FeautureCollection', :features => []}
        @listings.each do |listing|
             host = Host.find(listing.host_id)
             feature_hash = {:type => 'Feature', :geometry => {:type => 'Point',:coordinates => [host.longitude, host.latitude]},
                :properties => {:phone => host.phone_number,
                :address => host.address,
                :city => host.city,
                :country => 'United States',
                :postalCode => host.zip_code,
                :state => host.state,
                :space => listing.space,
                :duration =>listing.duration
                }
            }
            json_hash[:features] << feature_hash
        end
        @listing_json = json_hash.to_json
    end

    def new
        @listing = Listing.new
        @weeks = (1..10).to_a
    end
    def create
        h_id = params[:listing][:host_id].to_i
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

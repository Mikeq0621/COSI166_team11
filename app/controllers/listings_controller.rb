class ListingsController < ApplicationController

    def index
        @listings = Listing.where("space > 0")
        if user_logged_in?
            user = User.find(session[:user_id])
        else
            user = Host.find(session[:host_id])
        end
        @latitude = user.latitude
        @longitude = user.longitude
        json_hash = {:type => 'FeautureCollection', :features => []}
        @listings.each do |listing|
             host = Host.find(listing.host_id)
             feature_hash = {:type => 'Feature', :geometry => {:type => 'Point',:coordinates => [host.longitude, host.latitude]},
                :properties => {:listing_id => listing.id, :name => host.name, :phone => host.phone_number,
                :address => host.address,
                :city => host.city,
                :country => 'United States',
                :postalCode => host.zip_code,
                :state => host.state,
                :space => listing.space,
                :duration =>listing.duration,
                :price =>listing.price
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
        h_id = current_host.id
        dur = params[:listing][:duration].to_i
        
        @listing = Listing.new(host_id:h_id,space:params[:listing][:space],duration:dur, price:params[:listing][:price])
        if @listing.save
            redirect_to Host.find(h_id)
        else
            render 'new'
        end
    end

    def show
        @listing = Listing.find(params[:id])
        @host = Host.find(@listing.host_id)
        @requests = @listing.requests
    end

    def edit
        @listing = Listing.find(params[:listing_id])
    end

    def update
        @listing = Listing.find(params[:id])
        @listing.update(duration:params[:listing][:duration], price:params[:listing][:price], space:params[:listing][:space]) 
        if @listing.update(duration:params[:listing][:duration], price:params[:listing][:price], space:params[:listing][:space]) 
            flash[:success] = "Edit Succesfull!"
            #session.delete(:return_to)
            redirect_to listing_path(@listing)
        else
            render 'edit'
        end
    end

    def destroy
        listing = Listing.find(params[:listing_id])
        listing.destroy
        redirect_to current_host
    end
    
    
end

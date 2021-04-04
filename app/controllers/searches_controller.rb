class SearchesController < ApplicationController

  def search
    listings_hosts = Listing.joins(:host)
    user = User.find(session[:user_id])
    @latitude = user.latitude
    @longitude = user.longitude
    near_hosts = Host.near([user.latitude, user.longitude], 20)
    if params[:search_filter] == 'location'
      @results = listings_hosts.where(host_id: near_hosts.map{|h| h.id } )
    else 
      if params[:search].blank?
        @results = listings_hosts
        #redirect_to "/listings", flash: { danger: "Empty search field!" } and return

      elsif params[:search_filter] == 'city'
        @results = listings_hosts.where("city LIKE :search", search: params[:search]) 
      elsif params[:search_filter] == 'duration'
        #host_listings = listings_hosts.where("hosts.id = listings.host_id")
        @results = listings_hosts.all.where("duration > :search", search: params[:search])
      elsif params[:search_filter] == 'box'
        host_listings = listings_hosts.where("hosts.id = listings.host_id")
        @results = host_listings.all.where("space > :search", search: params[:search])
      else
        @results = listings_hosts.where("zip_code LIKE :search", search: params[:search]) 
      end
    end

    json_hash = {:type => 'FeautureCollection', :features => []}
    @results.each do |listing|
         host = Host.find(listing.host_id)
         feature_hash = {:type => 'Feature', :geometry => {:type => 'Point',:coordinates => [host.longitude, host.latitude]},
            :properties => {:listing_id => listing.id, :name => host.name, :phone => host.phone_number,
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

  
end
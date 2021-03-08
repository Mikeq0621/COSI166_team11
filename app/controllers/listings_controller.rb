class ListingsController < ApplicationController

    def index
        @listings = Listing.all
        #@listings_names 
    end
end

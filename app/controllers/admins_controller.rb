class AdminsController < ApplicationController

    def index
        @listings = Listing.all
        @users = User.all 
        @hosts = Host.all
    end

    

    
end

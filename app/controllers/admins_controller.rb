class AdminsController < ApplicationController

    def index
        @listings = Listing.all
        @users = User.all 
        @hosts = Host.all
    end

    def create_user

    end
    def create_host

    end

    def delete_user
        user = User.find(params[:user_id])
        user.destroy
        redirect_to admins_path
    end

    def delete_host
        host = Host.find(params[:host_id])
        host.destroy
        redirect_to admins_path
    end

    def new_listing
        @listing = Listing.new
        @host_names = Array.new
        @weeks = (1..10).to_a
        Host.all.each do |h|
            @host_names << h
        end
    end
    def create_listing
        host = Host.find_by(name:params[:host])
        listing = Listing.new(host_id:host.id,space:params[:space],duration:params[:duration],price:params[:price])
        if listing.save
            redirect_to admins_path
        else
            render 'new_listing'
        end
        
    end

    
end

class AdminsController < ApplicationController

    def index
        @listings = Listing.all
        @users = User.all 
        @hosts = Host.all
        @transactions = Transaction.all
        @requests = Request.all
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

    
    def new_request
        @user_names = Array.new
        User.all.each do |u| 
            @user_names << u
        end
    end

    def create_request
        listing = Listing.find(params[:listing_id])
        user = User.find_by(name:params[:user])
        request = Request.new(host_id:listing.host.id,listing_id:listing.id,user_id:user.id,boxes:params[:boxes],duration:params[:duration])
        if request.save 
            redirect_to admins_path
        else
            flash[:danger] = request.errors.full_messages
            render 'new_request'
        end
    end

    def new_transaction
        @host_names = Array.new
        Host.all.each do |h|
            @host_names << h
        end

        @user_names = Array.new
        User.all.each do |u| 
            @user_names << u
        end
        @listing = Listing.find(params[:listing_id])

        @weeks = (1..10).to_a

    end

    def create_transaction
        listing = Listing.find(params[:listing_id])
        user = User.find_by(name:params[:user])
        transaction = Transaction.new(host_id:listing.host.id,user_id:user.id,price:params[:price],duration:params[:duration],listing_id:listing.id)
        if transaction.save
            redirect_to admins_path
        else
            flash[:danger] = transaction.errors.full_messages
            render 'new_transaction'
        end
    end
    
    
end

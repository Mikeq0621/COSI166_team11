class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        #@listings_names 
    end

    def new
        @transaction = Transaction.new
    end

    def create
        listing = Listing.find(params[:transaction][:listing_id])
        user = User.find(params[:transaction][:user_id])
        transaction = Transaction.new(host_id:listing.host.id,user_id:params[:transaction][:user_id],listing_id:listing.id,price:30.00,duration:20)
        if transaction.save
            redirect_to user
        else
            render 'new'
        end

    end

    def destroy
        
    end
end

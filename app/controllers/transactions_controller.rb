class TransactionsController < ApplicationController
    def index
        @transactions = Transaction.all
        #@listings_names 
    end

    def new
        @transaction = Transaction.new
    end

    def create
        listing = Listing.find(params[:listing_id])
        user = current_user.id
        transaction = Transaction.new(host_id:listing.host.id,user_id:current_user.id,listing_id:listing.id,price:30.00,duration:20)
        if transaction.save
            
            redirect_to current_user
        else
            render 'new'
        end

    end

    def destroy
        
    end
end

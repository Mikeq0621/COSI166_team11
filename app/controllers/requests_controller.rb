class RequestsController < ApplicationController
    def new
        @listing = params[:listing_id]
        @request = Request.new
    end
    def create
        
        listing = Listing.find(params[:listing_id])
        @request = Request.new(host_id:listing.host_id,listing_id:params[:listing_id],user_id:current_user.id,boxes:params[:boxes].to_i,duration:params[:duration].to_i)
       
        if @request.save
            
            redirect_to current_user
        else
            redirect_to listing
        end
    end

    def destroy
        request = Request.find(params[:req_id]) 
        request.destroy
        #if accept -> create transaction and delete the request
        #else just delete the request
    end

    def accept
        request = Request.find(params[:req_id])
        listing = Listing.find(request.listing_id)
        
        transaction = Transaction.new(host_id:listing.host_id,user_id:request.user_id,listing_id:listing.id,price:30.00,duration:20)
        if transaction.save
            redirect_to current_host
        end
        request.destroy
    end

    
end

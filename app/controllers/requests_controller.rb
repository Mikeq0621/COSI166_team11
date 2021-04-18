class RequestsController < ApplicationController
    def new
        @listing = params[:listing_id]
        @request = Request.new
    end

    def create
        listing = Listing.find(params[:listing_id])
        @request = Request.new(host_id:listing.host_id,listing_id:params[:listing_id],user_id:current_user.id,boxes:params[:boxes].to_i,duration:params[:duration].to_i)
       
        if @request.save
            RequestNotification.with({listing:listing, user:current_user}).deliver(listing.host)
            UserMailer.requested_space(current_user,@request).deliver_now 

            redirect_to current_user
        else
            redirect_to listing
        end
    end

    def destroy
        request = Request.find(params[:req_id]) 
        request.destroy
        redirect_to current_host
        UserMailer.request_decision(request.user,request,"deny").deliver_now
        #if accept -> create transaction and delete the request
        #else just delete the request
    end

    def accept
        request = Request.find(params[:req_id])
        listing = Listing.find(request.listing_id)
        price = request.boxes*request.duration*listing.price
        transaction = Transaction.new(host_id:listing.host_id,user_id:request.user_id,listing_id:listing.id,price:price,duration:request.duration, boxes:request.boxes)
        if transaction.save
            listing.space = listing.space.to_i - request.boxes
            listing.save
            UserMailer.request_decision(request.user,request,"accept").deliver_now
            redirect_to current_host
        end
        request.destroy
    end

    
end

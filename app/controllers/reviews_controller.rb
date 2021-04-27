class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @host = Host.find(params[:host_id])
    end

    def create
        review = Review.new(user_id:current_user.id,host_id:params[:host_id],stars:params[:stars],comment:params[:comment])
        if review.save()
            redirect_to Host.find(params[:host_id])
        else 
            flash[:danger] = review.errors.full_messages
            render 'new'
        end
    end

    
end

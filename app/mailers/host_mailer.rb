class HostMailer < ApplicationMailer

    def welcome(host)
        @host = host
        mail to: host.email, subject:"Welcome to AirStorage"
    end

    def request_notification(r)
        @host = r.host
        @user = r.user 
        @request = r
        @price= @request.boxes * @request.listing.price * @request.duration
        mail to: @host.email, subject:"New Request"
    end

    def transaction(transaction)
        @host = transaction.host
        @user = transaction.user
        @transaction = transaction
        mail to: @host.email, subject:"Transaction Confirmation"
    end

    def user_message(user,host,message)
        @user = user
        @message = message
        mail to:host.email,subject:"Message from #{@user.name}"
    end
end

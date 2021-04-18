class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject:'Welcome to AirStorage'
  end

  def requested_space(user,request)
    @user = user
    @request = request
    @price= @request.boxes * @request.listing.price * @request.duration
    mail to: @user.email, subject:'Request Confirmation' 
  end

  def request_decision(user,request,decision)
    @user = user
    @request = request
    @dec = decision
    @price= @request.boxes * @request.listing.price * @request.duration
    mail to: @user.email, subject:'Request Decision'
  end
end

class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"
    @user = params[:user]
    mail to: @user.email, subject:'Welcome to AirStorage'
  end

  def requested_space
    @user = params[:user]
    @listing = params[:listing]
    mail to: @user.email, subject:'Request Confirmation' 
  end
end

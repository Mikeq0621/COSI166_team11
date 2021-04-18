class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def edit

  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      render 'edit'
      flash[:info] = "Reset your password:"
      # redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end
end

class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def edit
  end
  
  def user_reset
    @user = User.find_by(id: params[:param1])
    render 'user_edit'
  end

  def host_reset
    @host = Host.find_by(id: params[:param1])
    render 'host_edit'
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    @host = Host.find_by(email: params[:password_reset][:email].downcase)
    if !@user && !@host
      flash.now[:danger] = "Email address not found"
      render 'new'
    elsif @user && !@host
      render 'user_edit'
      flash[:info] = "Reset your password:"
      # redirect_to root_url
    elsif @host && !@user
      render 'host_edit'
      flash[:info] = "Reset your password:"
    else
      render 'choose_role'
    end
  end
end

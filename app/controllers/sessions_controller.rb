class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def newhost
  end

  def create_user
    # Find the signed up user in DB
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'User Logged in' 
      log_in user
      redirect_to user
    elsif user && (!user.authenticate(params[:session][:password]))
      flash.now[:danger] = 'Invalid password' 
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def create_host
    # Find the signed up user in DB
    host = Host.find_by(email: params[:session][:email].downcase)
    if host && host.authenticate(params[:session][:password])
      flash[:success] = 'Host Logged in'
      host_log_in host
      redirect_to host
    elsif host && (!host.authenticate(params[:session][:password]))
      flash.now[:danger] = 'Invalid password'
      render 'newhost'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'newhost'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the signed up user in DB
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Logged in' # Not quite right!
      log_in user
      redirect_to root_path
    elsif user && (!user.authenticate(params[:session][:password]))
      flash.now[:danger] = 'Invalid password' # Not quite right!
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end

end

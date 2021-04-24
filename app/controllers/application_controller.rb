class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :require_login

    private
  
    def require_login
      unless user_logged_in? || host_logged_in? || admin_logged_in?
        flash[:danger] = "You must be logged in to access this section"
        redirect_to '/userlogin'
      end
    end
end

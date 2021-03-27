module SessionsHelper
    # Log in a given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    def host_log_in(host)
        session[:host_id] = host.id
    end

        
    # Returns the current logged-in user (if any).
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def current_host
        if session[:host_id]
            @current_host ||= Host.find_by(id: session[:host_id])
        end
    end


    def user_logged_in?
        !current_user.nil?
    end

    def host_logged_in?
        !current_host.nil?
    end

    # Logs out the current user.
    def log_out
        reset_session
        if @current_user
            @current_user = nil
        elsif @current_host
            @current_host = nil
        end
    end

end

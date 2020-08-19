module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    # TODO: Fix this to delete everything except current geolocation
    reset_session
    @current_user = nil
  end
  
  def correct_user?(user)
    user && user == current_user
  end

  def store_target_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def store_previous_location
    # TODO: This is buggy. Needs to be reworked.
    session[:forwarding_url] = request.referer ? URI(request.referer).path : root_path
  end

end

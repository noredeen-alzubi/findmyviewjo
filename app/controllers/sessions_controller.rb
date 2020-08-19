class SessionsController < ApplicationController

  def new
    store_previous_location
  end

  def create
    if user = User.find_by(email:params[:session][:email].downcase)
      if user.authenticate(params[:session][:password])
        forwarding_url = session[:forwarding_url]
        reset_session
        log_in user
        redirect_to forwarding_url || stunning_views_path
      else
        flash.now[:danger] = 'Wrong password'
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end 

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
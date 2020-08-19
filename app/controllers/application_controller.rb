class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def request_ip
    if Rails.env.development? && params[:ip]
      params[:ip]
    else
      request.remote_ip
    end
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end

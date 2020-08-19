class PagesController < ApplicationController
  def home
    #location = JSON.parse(RestClient.get("https://reallyfreegeoip.org/json/90.84.73.13"))
    session[:current_latitude] = 31
    session[:current_longitude] = 36
  end
  def about
  end
end

class WebconsoleController < ApplicationController

  NOTIFY_URL = "https://api.cloud.appcelerator.com/v1/push_notification/notify.json"
  LOGIN_URL = "https://api.cloud.appcelerator.com/v1/users/login.json"
  KEY = "1Tfbi5D2Qd75mbwwDedTgGUiIlATvPyO"

  def index
    
  end

  def notify
    if session[:acs_cookies].nil?
      res = RestClient.post "#{LOGIN_URL}?key=#{KEY}", {:login => "lizhe", :password => "sdfsdf"}
      session[:acs_cookies] = res.cookies
    end
    RestClient.post "#{NOTIFY_URL}?key=#{KEY}", {:channel => "demo_alert", :payload => {
      :badge => params[:badge].to_i,
      :alert => params[:msg]
    }}, :cookies => session[:acs_cookies]
    flash[:notice] = "send message successfully"
    redirect_to :back
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery

  KEY = "2TtjyUFMKmqBVJTYxPXnvl20Svu7C9G1"
  LOGIN_URL = "https://api.cloud.appcelerator.com/v1/users/login.json"

  def acs_authenticate
    res = RestClient.post "#{LOGIN_URL}?key=#{KEY}", {:login => "lizhe", :password => "sdfsdf"}
    session[:acs_cookies] = res.cookies
  end

  def acs_post url, parameters
    RestClient.post "#{url}?key=#{KEY}", parameters, :cookies => session[:acs_cookies]
  end

end

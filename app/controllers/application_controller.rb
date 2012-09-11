class ApplicationController < ActionController::Base
  protect_from_forgery

  KEY = "1Tfbi5D2Qd75mbwwDedTgGUiIlATvPyO"
  LOGIN_URL = "https://api.cloud.appcelerator.com/v1/users/login.json"

  def acs_authenticate
    if session[:acs_cookies].nil?
      res = RestClient.post "#{LOGIN_URL}?key=#{KEY}", {:login => "lizhe", :password => "sdfsdf"}
      session[:acs_cookies] = res.cookies
    end
  end

  def acs_post url, parameters
    RestClient.post "#{url}?key=#{KEY}", parameters, :cookies => session[:acs_cookies]
  end

end

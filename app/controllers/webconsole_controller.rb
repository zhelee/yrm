class WebconsoleController < ApplicationController

  NOTIFY_URL = "https://api.cloud.appcelerator.com/v1/push_notification/notify.json"

  before_filter :acs_authenticate, :only => :notify

  def index
  end

  def notify
    acs_post NOTIFY_URL, {:channel => "demo_alert", :payload => {
      :badge => params[:badge].to_i,
      :alert => params[:msg]
    }}
    flash[:notice] = "send message successfully"
    redirect_to :back
  end

end

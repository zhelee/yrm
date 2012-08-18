class Users::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token, :if => lambda { |c| c.request.xhr? == 0 }

  def create
    respond_to do |format|
      format.html{ super }
      format.json do
       resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
       return sign_in_and_redirect(resource_name, resource)
      end
    end
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    respond_to do |format|
      format.json {render :json => {:code => 0, :msg => {:user => current_user.to_json}} }
      format.html {redirect_to root_url}
    end
  end

  def failure
    respond_to do |format|
      format.json { render:json => {:code => 1, :msg => {:unkonwn => "unkonwn reason"}} }
    end
  end

end

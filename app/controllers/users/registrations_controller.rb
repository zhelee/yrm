class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, :if => lambda { |c| c.request.xhr? == 0 }

  def create
    respond_to do |format|
      format.html { super }
      format.json {
        user = User.create({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]})
        if user.new_record?
          render :json => {:code => 1, :msg => user.errors.messages}
        else
          sign_in(user)
          render :json => {:code => 0, :msg => {:user => user.to_json, :authentication_token => current_user.authentication_token}}
        end
      }
    end
  end

  def update
    respond_to do |format|
      format.html { super }
      format.json {
        user_info = params.except(:format, :_method, :authentication_token, :controller, :action, :version)
        current_user.update_attributes!(user_info)
        current_user.reload
        render :json => {:code => 0, :msg => {:user => current_user.to_json}}
      }
    end
  end

end

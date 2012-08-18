class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, :if => lambda { |c| c.request.xhr? == 0 }

  def create
    user = User.create({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]})
    if user.new_record?
      render :json => {:code => 1, :msg => user.errors.messages}
    else
      sign_in(user)
      render :json => {:code => 0, :msg => {:user => user.to_json}}
    end
  end

  def update
    user_info = params.except(:_method, :authentication_token, :controller, :action)
    current_user.update_attributes!(user_info)
    current_user.reload
    render :json => {:code => 0, :msg => {:user => current_user.to_json}}
  end

end

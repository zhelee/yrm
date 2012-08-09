class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, :if => lambda { |c| c.request.xhr? == 0 }

  def create
    user = User.create({:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation]})
    if user.new_record?
      render :json => {:code => 2, :msg => user.errors.messages}
    else
      render :json => {:code => 1, :msg => {:user_id => user.id}}
    end
  end

end

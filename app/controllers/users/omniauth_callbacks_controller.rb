class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def weibo
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_weibo_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Weibo"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.weibo_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
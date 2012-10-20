module Api
  class BaseController < ::ApplicationController
    skip_before_filter :verify_authenticity_token
    prepend_before_filter :get_authentication_token
    before_filter :authenticate_user!
    respond_to :json

  private

    def get_authentication_token
      params[:auth_token] = request.headers["auth_token"]
    end

  end
end

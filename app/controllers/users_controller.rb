class UsersController < ApplicationController
  
  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def update_location
    user = User.find params[:id]
    user.update_attribute(:location, params[:location])
    binding.pry
  end

end

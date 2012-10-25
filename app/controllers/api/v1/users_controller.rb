module Api
  module V1
    class UsersController < ApplicationController
      skip_before_filter :verify_authenticity_token
      before_filter :skip_trackable
      respond_to :json

      def login
        @user = User.find_for_database_authentication(:email => params[:email])
        if @user && @user.valid_password?(params[:password])
          sign_in @user
        else
          render :login_error
        end
      end

      def register
        @user = User.new(params[:user])
        if @user.save
          sign_in @user
        else
          render :register_error
        end
      end

    private

      def skip_trackable
        request.env['devise.skip_trackable'] = true
      end

    end
  end
end

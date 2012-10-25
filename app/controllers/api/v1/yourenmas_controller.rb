module Api
  module V1
    class YourenmasController < Api::BaseController

      def index
        @yourenmas = Yourenma.all
        respond_with @yourenmas
      end

      def create
        user = User.find_by_username(params[:user])
        topic = Topic.find_by_name(params[:topic])
        yourenma = Yourenma.new({
          :user => user,
          :topic => topic,
          :place => params[:place],
          :description => params[:description]
        })
        if yourenma.save
          render :json => {:code => 0, :id => yourenma.id}
        else
          render :json => {:code => 1, :info => yourenma.errors}
        end
      end

      def update
        @yourenma = Yourenam.find params[:id]
        respond_with @yourenma
      end

      def destroy
        yourenma = Yourenma.find params[:id]
        if yourenma
          yourenma.destroy
          @message = "deleted successfully"
        else
          @message = "can not find the record"
        end
      end
    end
  end
end

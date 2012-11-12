class YourenmasController < ApplicationController

  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    @yourenmas = current_user.around_me.collect{|user| user.yourenmas }.flatten
    respond_with @yourenmas
  end

  def around_me
    
  end

  def create
    user_id = User.find_by_username(params[:user]).id
    topic_id = Topic.find_by_name(params[:topic]).id
    yourenma = Yourenma.create({
      :user_id => user_id,
      :topic_id => topic_id,
      :description => params[:description]
    })
    respond_with yourenma
  end

  def update
    @yourenma = Yourenma.find params[:id]
    respond_with @yourenma
  end

  def destroy
    yourenma = Yourenma.find params[:id]
    yourenma.destroy
    respond_with yourenma
  end

end

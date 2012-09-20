class YourenmasController < ApplicationController

  def index
    if(params[:topic])
      @yourenmas = Topic.find_by_name(params[:topic]).yourenma
    else
      @yourenmas = Yourenma.order("created_at DESC").all
    end
    respond_to do |format|
      format.json
    end
  end

end

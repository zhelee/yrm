class YourenmasController < ApplicationController

  def index
    @yourenmas = Yourenma.order("created_at DESC").all
    respond_to do |format|
      format.json
    end
  end

end

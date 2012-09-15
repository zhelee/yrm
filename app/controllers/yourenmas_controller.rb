class YourenmasController < ApplicationController

  def index
    @yourenmas = Yourenma.all
    respond_to do |format|
      format.json { render :json => @yourenmas.to_json }
    end
  end

end

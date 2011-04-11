class GoogleMapController < ApplicationController
  
  def index
	@lat = params[:lat]
	@lon = params[:lon]
	@zoom = params[:zoom]
	render :layout => false
  end
end

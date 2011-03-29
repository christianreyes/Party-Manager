class GuestsController < ApplicationController
  before_filter :login_required
  
  def index
    @guests = current_host.guests
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
	@parties = current_host.parties
    @guest = Guest.new
  end

  def create
	@parties = current_host.parties
    @guest = Guest.new(params[:guest])
    if @guest.save
      redirect_to @guest, :notice => "Guest was successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
	@parties = current_host.parties
    @guest = Guest.find(params[:id])
  end

  def update
    @parties = current_host.parties
	@guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])
      redirect_to @guest, :notice  => "Successfully updated guest."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_url, :notice => "Successfully destroyed guest."
  end
end

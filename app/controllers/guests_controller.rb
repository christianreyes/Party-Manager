class GuestsController < ApplicationController
  before_filter :login_required
  def index
    @guests = current_user.guests
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
  	params[:guest][:host_id] = current_user.id
    @guest = Guest.new(params[:guest])
    if @guest.save
      flash[:notice] = "Successfully created guest."
      redirect_to guests_url
    else
      render :action => 'new'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(params[:guest])
      flash[:notice] = "Successfully updated guest."
      redirect_to guest_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    flash[:notice] = "Successfully destroyed guest."
    redirect_to guests_url
  end
end

class GuestsController < ApplicationController
  before_filter :login_required
  # GET /guests
  # GET /guests.xml
  def index
    @guests = current_host.guests.all
  end

  # GET /guests/1
  # GET /guests/1.xml
  def show
    @guest = Guest.find(params[:id])
	@invitations = @guest.invitations
  end

  # GET /guests/new
  # GET /guests/new.xml
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
    @guest = Guest.find(params[:id])
  end

  # POST /guests
  # POST /guests.xml
  def create
    params[:guest][:host_id] = current_host.id
    @guest = Guest.new(params[:guest])

    respond_to do |format|
      if @guest.save
        format.html { redirect_to(@guest, :notice => 'Guest was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /guests/1
  # PUT /guests/1.xml
  def update
    @guest = Guest.find(params[:id])
	@guest.host_id = current_host.id

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to(@guest, :notice => 'Guest was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.xml
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to(guests_url) }
    end
  end
end

class GiftsController < ApplicationController
  before_filter :login_required
  # GET /gifts
  # GET /gifts.xml
  def index
    @gifts = current_host.gifts
  end

  # GET /gifts/1
  # GET /gifts/1.xml
  def show
    @gift = Gift.find(params[:id])
  end

  # GET /gifts/new
  # GET /gifts/new.xml
  def new
    @gift = Gift.new
	@invitations = current_host.invitations
	@invite_hash = {}
    @invitations.each do |i| 
		@invite_hash["#{i.party.name} | #{i.guest.name}"] = i.id
	end
  end

  # GET /gifts/1/edit
  def edit
    @gift = Gift.find(params[:id])
	@invitations = current_host.invitations
	@invite_hash = {}
    @invitations.each do |i| 
		@invite_hash["#{i.party.name} | #{i.guest.name}"] = i.id
	end
  end

  # POST /gifts
  # POST /gifts.xml
  def create
    @gift = Gift.new(params[:gift])
	@invitations = current_host.invitations
	@invite_hash = {}
    @invitations.each do |i| 
		@invite_hash["#{i.party.name} | #{i.guest.name}"] = i.id
	end

    respond_to do |format|
      if @gift.save
		PartyMailer.gift_thank_you(@gift).deliver  
        format.html { redirect_to(@gift, :notice => 'Gift was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /gifts/1
  # PUT /gifts/1.xml
  def update
    @gift = Gift.find(params[:id])
	@invitations = current_host.invitations
	@invite_hash = {}
    @invitations.each do |i| 
		@invite_hash["#{i.party.name} | #{i.guest.name}"] = i.id
	end

    respond_to do |format|
      if @gift.update_attributes(params[:gift])
        format.html { redirect_to(@gift, :notice => 'Gift was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.xml
  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to(gifts_url) }
    end
  end
end

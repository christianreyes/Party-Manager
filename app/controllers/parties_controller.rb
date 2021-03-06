class PartiesController < ApplicationController
  before_filter :login_required
  # GET /parties
  # GET /parties.xml
  def index
    @upcoming_parties = current_host.parties.upcoming
	@past_parties = current_host.parties.past
  end

  # GET /parties/1
  # GET /parties/1.xml
  def show
    @party = Party.find(params[:id])
	@invitations = @party.invitations.all
  end

  # GET /parties/new
  # GET /parties/new.xml
  def new
    @party = Party.new
	@locations = current_host.locations

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
	@locations = current_host.locations
  end

  # POST /parties
  # POST /parties.xml
  def create
    params[:party][:host_id] = current_host.id
	@locations = current_host.locations

    @party = Party.new(params[:party])
	if params[:new_location_name] != "" && params[:new_location_address] != ""
		l = Location.new( :name => params[:new_location_name], :address => params[:new_location_address] )
		l.host_id = current_host.id
		l.save!
		@party.location_id = l.id
	end
    respond_to do |format|
      if @party.save
        format.html { redirect_to(@party, :notice => 'Party was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.xml
  def update
    @party = Party.find(params[:id])
	params[:party][:host_id] = current_host.id
	@locations = current_host.locations
	
	if params[:new_location_name] != "" && params[:new_location_address] !=""
		l = Location.new( :name => params[:new_location_name], :address => params[:new_location_address] )
		l.host_id = current_host.id
		l.save!
		params[:party][:location_id] = l.id
	end

	
    respond_to do |format|
      if @party.update_attributes(params[:party])
		@party.invitations.each do |i|
			PartyMailer.party_update(i).deliver
		end
        format.html { redirect_to(@party, :notice => 'Party was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.xml
  def destroy
    @party = Party.find(params[:id])
	@party.invitations.each do |i|
		PartyMailer.party_delete(i).deliver
	end
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url, :notice => 'Party was successfully deleted and all guests notified.') }
    end
  end
end

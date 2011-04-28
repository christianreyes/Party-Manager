class PartiesController < ApplicationController
  before_filter :login_required
  # GET /parties
  # GET /parties.xml
  def index
    @upcoming_parties = current_host.parties.upcoming
	@past_parties = current_host.parties.past

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.xml
  def show
    @party = Party.find(params[:id])
	@invitations = @party.invitations.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @party }
    end
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
    @party = Party.new(params[:party])
	if params[:new_location_name] && params[:new_location_address]
		l = Location.new( :name => params[:new_location_name], :address => params[:new_location_address] )
		l.host_id = current_host.id
		l.save!
		@party.location_id = l.id
	end
    respond_to do |format|
      if @party.save
        format.html { redirect_to(@party, :notice => 'Party was successfully created.') }
        format.xml  { render :xml => @party, :status => :created, :location => @party }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
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
		params[:party][:location_id] = l.id
	end

	
    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to(@party, :notice => 'Party was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.xml
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url) }
      format.xml  { head :ok }
    end
  end
end

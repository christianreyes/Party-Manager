class InvitationsController < ApplicationController
  before_filter :login_required
  # GET /invitations
  # GET /invitations.xml
  def index
    @invitations = current_host.invitations
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new
	@parties = current_host.parties.all
	@guests = current_host.guests.all
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
	@parties = current_host.parties.all
	@guests = current_host.guests.all
  end

  # POST /invitations
  # POST /invitations.xml
  def create
    @invitation = Invitation.new(params[:invitation])
	@parties = current_host.parties.all
	@guests = current_host.guests.all

    respond_to do |format|
      if @invitation.save
		PartyMailer.email_invitation(@invitation).deliver  
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])
	@parties = current_host.parties.all
	@guests = current_host.guests.all
	
    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to(invitations_url) }
    end
  end
  
  def rsvp
	@invitation = Invitation.by_invite_code(params[:invite_code]).first
  end
  
  def rsvp_create
  
  end
end

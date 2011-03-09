class GuestInvitationsController < ApplicationController
  before_filter :login_required
  def index
    @guest_invitations = current_user.guest_invitations
  end

  def show
    @guest_invitation = GuestInvitation.find(params[:id])
  end
  
  def rsvp
  	@guest_invitation = GuestInvitation.by_invite(params[:invite_code]).first
  end

  def new
    @guest_invitation = GuestInvitation.new
    @current_user_parties = current_user.parties
    @current_user_guests = current_user.guests
  end

  def create
  	params[:guest_invitation][:invited_by] = current_user.id
    @guest_invitation = GuestInvitation.new(params[:guest_invitation])
    if @guest_invitation.save
      flash[:notice] = "Successfully created and emailed guest invitation."
      redirect_to @guest_invitation
      PartyMailer.email_invitation(@guest_invitation).deliver  
    else
      render :action => 'new'
    end
  end

  def edit
    @guest_invitation = GuestInvitation.find(params[:id])
  end

  def update
    @guest_invitation = GuestInvitation.find(params[:id])
    if @guest_invitation.update_attributes(params[:guest_invitation])
      flash[:notice] = "Successfully updated guest invitation."
      redirect_to guest_invitation_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest_invitation = GuestInvitation.find(params[:id])
    @guest_invitation.destroy
    flash[:notice] = "Successfully destroyed guest invitation."
    redirect_to guest_invitations_url
  end
end

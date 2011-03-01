class GuestInvitationsController < ApplicationController
  def index
    @guest_invitations = GuestInvitation.all
  end

  def show
    @guest_invitation = GuestInvitation.find(params[:id])
  end

  def new
    @guest_invitation = GuestInvitation.new
  end

  def create
  	params[:guest_invitation][:invited_by] = current_user
    @guest_invitation = GuestInvitation.new(params[:guest_invitation])
    if @guest_invitation.save
      flash[:notice] = "Successfully created guest invitation."
      redirect_to @guest_invitation
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

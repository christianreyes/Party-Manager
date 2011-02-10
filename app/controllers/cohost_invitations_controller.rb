class CohostInvitationsController < ApplicationController
  def index
    @cohost_invitations = CohostInvitation.all
  end

  def show
    @cohost_invitation = CohostInvitation.find(params[:id])
  end

  def new
    @cohost_invitation = CohostInvitation.new
  end

  def create
    @cohost_invitation = CohostInvitation.new(params[:cohost_invitation])
    if @cohost_invitation.save
      flash[:notice] = "Successfully created cohost invitation."
      redirect_to @cohost_invitation
    else
      render :action => 'new'
    end
  end

  def edit
    @cohost_invitation = CohostInvitation.find(params[:id])
  end

  def update
    @cohost_invitation = CohostInvitation.find(params[:id])
    if @cohost_invitation.update_attributes(params[:cohost_invitation])
      flash[:notice] = "Successfully updated cohost invitation."
      redirect_to cohost_invitation_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cohost_invitation = CohostInvitation.find(params[:id])
    @cohost_invitation.destroy
    flash[:notice] = "Successfully destroyed cohost invitation."
    redirect_to cohost_invitations_url
  end
end

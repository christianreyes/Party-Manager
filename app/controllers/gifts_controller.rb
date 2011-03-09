class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
    @invitations = current_user.guest_invitations
    @invitations. each { |invitation| (@invite_hash ||= {})["#{invitation.party.name} | #{invitation.guest.name}"] = invitation.id }
  end

  def create
    @gift = Gift.new(params[:gift])
    if @gift.save
      flash[:notice] = "Successfully created gift."
      redirect_to @gift
    else
      render :action => 'new'
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      flash[:notice] = "Successfully updated gift."
      redirect_to gift_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    flash[:notice] = "Successfully destroyed gift."
    redirect_to gifts_url
  end
end

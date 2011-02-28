class PartiesController < ApplicationController
  before_filter :login_required
  def index
    @parties = current_user.parties
  end

  def show
    @party = Party.find(params[:id])
    @party_type = @party.party_type
    @guests = @party.guests
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params[:party])
    @party.user_id = session[:user_id]
    if @party.save
      flash[:notice] = "Successfully created party."
      redirect_to @party
    else
      render :action => 'new'
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    if @party.update_attributes(params[:party])
      flash[:notice] = "Successfully updated party."
      redirect_to party_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    flash[:notice] = "Successfully destroyed party."
    redirect_to parties_url
  end
end

class PartiesController < ApplicationController
  before_filter :login_required
  
  def index
    @upcoming_parties = current_user.parties.upcoming
    @past_parties = current_user.parties.past
  end

  def show
    @party = Party.find(params[:id])
    @guests = @party.guests
    @invitations = @party.guest_invitations
    #5.times { guests_to_add = @party.guests.build }
  end

  def new
    @party = Party.new
  end

  def create
  	params[:party][:user_id] = current_user.id
    params[:party][:date] = string_to_date(params[:party][:date])
    params[:party][:rsvp_date] = string_to_date(params[:party][:rsvp_date])
    @party = Party.new(params[:party])
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
    params[:party][:date] = string_to_date(params[:party][:date])
    params[:party][:rsvp_date] = string_to_date(params[:party][:rsvp_date])
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

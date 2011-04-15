class HomeController < ApplicationController
  before_filter :login_required, :only => 'dashboard'
  def index
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def dashboard
  end

end

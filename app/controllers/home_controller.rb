class HomeController < ApplicationController
  def index
    @ip = request.remote_ip
  end
  
  def contact
  end
  
  def about
  end
  
  def privacy
  end
end

class HomeController < ApplicationController
  def index
  	if(logged_in?)
  		redirect_to parties_path
  	else
    	@ip = request.remote_ip
    end
  end
  
  def contact
  end
  
  def about
  end
  
  def privacy
  end
end

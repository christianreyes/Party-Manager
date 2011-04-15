# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_host.username %>.
#     <%= link_to "Edit profile", edit_current_host_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_host, :logged_in?, :administrator?, :redirect_to_target_or_default
  end

  def current_host
    begin
		@current_host ||= Host.find(session[:host_id]) if session[:host_id]
	rescue ActiveRecord::RecordNotFound => e
  		@current_host = nil
	end
  end

  def logged_in?
    current_host
  end
  
  def administrator?
    current_host.administrator if logged_in?
  end

  def login_required
    unless logged_in?
      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.url
  end
end

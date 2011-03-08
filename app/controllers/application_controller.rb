class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include ApplicationHelper
  protect_from_forgery
  
  helper :layout
end

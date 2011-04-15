class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include LayoutHelper
  protect_from_forgery
end

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
   # Start by using ActiveRecord macros
  
  should have_many :parties
  
  should validate_presence_of :name
  
  #should allow_value("Dusty").for(:first_name)
  #should allow_value("Billy Bob").for(:first_name)
  #should_not allow_value("kelly").for(:first_name)
  #should_not allow_value("Fred1").for(:first_name)
end

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
   # Start by using ActiveRecord macros
  
  should have_many :parties
  
  should validate_presence_of :name
  
  #should allow_value("Billy Bob").for(:first_name)
  #should_not allow_value("Fred1").for(:first_name)
  
  # -------------------------------------------------
  # More shoulda testing for the other methods, etc.
  # by setting up context(s)
  #
  context "A CMU with address - no lat long" do
    # create the object I want with a factory with 'setup' method
    setup do
      @cmu = Factory.create(:location, :name => "Carnegie Mellon",
      								   :street => "5032 Forbes Ave",
      								   :city => "Pittsburgh",
      								   :state => "PA",
      								   :zip => "15289",
      								   :description => "Good description here")
    end
   
    should "has a correct virtual address" do
      assert_equal "5032 Forbes Ave, Pittsburgh, PA 15289", @cmu.address
    end
       
    # now destroy the factory with 'teardown' method
    teardown do
      @cmu.destroy
    end
    
  end
end

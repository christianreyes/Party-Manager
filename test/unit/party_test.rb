require 'test_helper'

class PartyTest < ActiveSupport::TestCase

  should belong_to(:host)
  should belong_to(:location)
  should have_many(:invitations)
  should have_many(:guests).through(:invitations)
  
  # Validation macros...
  should validate_presence_of(:name)
  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:end_time)
  
  context "Creating a party for a host" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create!(:host)
	  @p = Factory.create!(:party, :host => @chris)
	  #@brian = Factory.create(:guest, :name => "Brian", :host => @chris)
	  #@i = Factory.create(:invitation, :host => @chris,  :guest => @brian)
    end
    
    # and provide a teardown method as well
    teardown do
	  #@i.destroy
	  @p.destroy
      @chris.destroy
	  #@brian.destroy
    end
	
	should "Have created the parties" do
	  assert_equal 'My fun party!', @p.name
	end
  end
end

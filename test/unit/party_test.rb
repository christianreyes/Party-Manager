require 'test_helper'

class PartyTest < ActiveSupport::TestCase

  should belong_to(:host)
  should belong_to(:location)
  should have_many(:invitations)
  should have_many(:guests).through(:invitations)
  
  # Validation macros...
  should validate_presence_of(:name)
  should validate_presence_of(:date)
  #should validate_presence_of(:start_time)
  #should validate_presence_of(:end_time)
  
  context "Creating a party for a host" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create(:host)
	  @loc = Factory.create(:location, :host => @chris)
	  @pt = Factory.create(:party_type)
	  @p = Factory.create(:party, :name => "My fun party!", :host => @chris, :location => @loc, :party_type => @pt)
	  @p2 = Factory.create(:party, :name => "My past party!", :host => @chris, :date => 10.months.ago, :rsvp_date => nil, :location => @loc, :party_type => @pt)
	  #@brian = Factory.create(:guest, :name => "Brian", :host => @chris)
	  #@i = Factory.create(:invitation, :host => @chris,  :guest => @brian)
    end
    
    # and provide a teardown method as well
    teardown do
	  #@i.destroy
	  @loc.destroy
	  @pt.destroy
	  @p.destroy
      @chris.destroy
	  #@brian.destroy
    end
	
	should "Have created the parties" do
	  assert_equal 'My fun party!', @p.name
	  assert_equal "My past party!", @p2.name
	end

	should "have upcoming and past scopes working" do
	  assert_equal "My fun party!", @chris.parties.upcoming.first.name
	  assert_equal "My past party!", @chris.parties.past.first.name
	end
  end
end

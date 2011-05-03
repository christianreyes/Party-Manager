require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  should belong_to(:party)
  should belong_to(:guest)
  should have_many(:gifts)
  
  # Validation macros...
  should validate_presence_of(:party_id)
  should validate_presence_of(:guest_id)
  should validate_presence_of(:expected_attendees)
  
  context "Creating two parties for two hosts and invite 2 guests to each party" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create(:host, :first_name => 'Christian')
	  @cp = Factory.create(:party, :name => 'My fun party!', :host => @chris)
	  @brian = Factory.create(:guest, :name => "Brian", :host => @chris)
	  @bi = Factory.create(:invitation, :host => @chris,  :guest => @brian)
	  @mike = Factory.create(:guest, :name => "Mike", :host => @chris)
	  @mi = Factory.create(:invitation, :host => @chris,  :guest => @mike)
	  #@puja = Factory.create(:host, :first_name => 'Puja')
	  #@pp = Factory.create(:party, :name => 'My SUPER fun party!', :host => @chris)
	  #@pbrian = Factory.create(:guest, :name => "Brian G", :host => @puja)
	  #@pbi = Factory.create(:invitation, :host => @puja,  :guest => @pbrian)
	  #@pmike = Factory.create(:guest, :name => "Mike B", :host => @puja)
	  #@pmi = Factory.create(:invitation, :host => @puja,  :guest => @pmike)
    end
    
    # and provide a teardown method as well
    teardown do
	  @bi.destroy 
	  @mi.destroy
	  @cp.destroy
	  @brian.destroy
	  @mike.destroy
	  @chris.destroy
	  #@pbi.destroy 
	  #@pmi.destroy
	  #@pp.destroy
	  #@pbrian.destroy
	  #@pmike.destroy
	  #@puja.destroy
    end
	
	should "show that each party has the right guests" do
      assert_equal [@brian, mike], @cp.guests
    end
  end
		
end

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  should belong_to(:party)
  should belong_to(:guest)
  should have_many(:gifts)
  
  # Validation macros...
  should validate_presence_of(:party_id)
  should validate_presence_of(:guest_id)
  should validate_presence_of(:expected_attendees)
  
  should allow_value(2).for(:party_id)
  should_not allow_value("a").for(:party_id)
  
  context "Creating two guests and inviting them to the party" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create(:host, :first_name => "Christian", :last_name => "Reyes")
	  @loc = Factory.create(:location, :host => @chris)
	  @pt = Factory.create(:party_type)
	  @p = Factory.create(:party, :name => 'My fun party!', :host => @chris, :location => @loc, :party_type => @pt)
	  @g1 = Factory.create(:guest, :name => "Brian", :host => @chris)
	  @g2 = Factory.create(:guest, :name => "Puja", :host => @chris)
	  @i1 = Factory.create(:invitation, :guest => @g1, :party => @p, :expected_attendees => 5, :actual_attendees => 4)
	  @i2 = Factory.create(:invitation, :guest => @g2, :party => @p, :expected_attendees => 10, :actual_attendees => nil)
	  
	  @puja = Factory.create(:host, :first_name => "Puja", :last_name => "Agarwal")
	  @ploc = Factory.create(:location, :host => @Puja)
	  @ppt = Factory.create(:party_type)
	  @pp = Factory.create(:party, :name => 'Phase 4!', :host => @puja, :location => @ploc, :party_type => @ppt)
	  @pg1 = Factory.create(:guest, :name => "Mike", :host => @puja)
	  @pg2 = Factory.create(:guest, :name => "Brandon", :host => @puja)
	  @pi1 = Factory.create(:invitation, :guest => @pg1, :party => @pp)
	  @pi2 = Factory.create(:invitation, :guest => @pg2, :party => @pp)
	end
	
	should "Have created the parties guests and invitations" do
	  assert_equal 'My fun party!', @p.name
	  assert_equal 'Brian', @g1.name
	  assert_equal 'Christian Reyes', @g1.host.name
	  assert_equal 'Brian', @i1.guest.name
	  assert_equal 'Puja', @i2.guest.name
	  assert_equal 'My fun party!', @i1.party.name
	  assert_equal 'Phase 4!', @pp.name
	  assert_equal 'Mike', @pg1.name
	  assert_equal 'Puja Agarwal', @pg1.host.name
	  assert_equal 'Mike', @pi1.guest.name
	  assert_equal 'Brandon', @pi2.guest.name
	  assert_equal 'Phase 4!', @pi1.party.name
	end
	
	should "make sure the invite code and url is being generated" do
	  assert_not_nil @i1.invite_code
	  assert_not_nil @i1.invite_url.match(/rsvp\/\w+/)
	  assert_not_nil @i2.invite_code
	  assert_not_nil @i2.invite_url.match(/rsvp\/\w+/)
	  assert_not_equal @i1.invite_code, @i2.invite_code
	end
	
	should "be properly summing expected and actual attendees for guests in the invitations" do
	  assert_equal 15, @p.number_expected_guests 
	  assert_equal 4, @p.number_actual_guests
	end
	
	teardown do
	  @i1.destroy
	  @i2.destroy
	  @loc.destroy
	  @p.destroy
	  @g1.destroy
	  @g2.destroy
	  @chris.destroy
	  
	  @pi1.destroy
	  @pi2.destroy
	  @ploc.destroy
	  @pp.destroy
	  @pg1.destroy
	  @pg2.destroy
	  @puja.destroy
	end
	
  end
		
end

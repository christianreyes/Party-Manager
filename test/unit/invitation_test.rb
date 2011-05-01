require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  should belong_to(:party)
  should belong_to(:guest)
  should have_many(:gifts)
  
  # Validation macros...
  should validate_presence_of(:party_id)
  should validate_presence_of(:guest_id)
  should validate_presence_of(:expected_attendees)
  
   # ---------------------------------
  # Testing other methods with a context
  context "Creating one invitation for two guests from two hosts for one party" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create!(:host, :first_name => 'Christian')
      @puja = Factory.create!(:host, :first_name => 'Puja')
      @a = Factory.create!(:guest, :name => 'Billy', :host => @puja)
	  @b = Factory.create!(:guest, :name => 'Bob', :host => @puja)
	  @c = Factory.create!(:guest, :name => 'Brandon', :host => @chris)
	  @d = Factory.create!(:guest, :name => 'Mike', :host => @chris)
	  @p1 = Factory.create!(:party, :host => @puja, :name => "Super fun party")
	  #@e = Factory.create!(:invitation, :guest => @a, :host => @puja, :party => @p1)
	  #@f = Factory.create!(:invitation, :guest => @b, :host => @puja, :party => @p1)
	  @p2 = Factory.create!(:party, :host => @chris, :name => "Super fun party")
	  #@g = Factory.create!(:invitation, :guest => @c, :host => @chris, :party => @p2)
	  #@h = Factory.create!(:invitation, :guest => @d, :host => @chris, :party => @p2)
    end
    
    # and provide a teardown method as well
    teardown do
	  @a.destroy
	  @b.destroy
	  @c.destroy
	  @d.destroy
      @chris.destroy
	  @puja.destroy
	  #@e.destroy
	  #@f.destroy
	  #@g.destroy
	  #@h.destroy
	  @p1.destroy
	  @p2.destroy 
    end
  
    # now run the tests:
    # test one of each type of factory (not really required, but not a bad idea)
	should "show that the invitations and guests were created properly" do
      assert_equal "Christian", @chris.first_name
      assert_equal "Puja", @puja.first_name
      assert_equal "Billy", @a.name
	  assert_equal "Bob", @b.name
	  assert_equal "Brandon", @c.name
	  assert_equal "Mike", @d.name
	  #assert_equal "Billy", @e.guest.name
	  #assert_equal "Bob", @f.guest.name
	  #assert_equal "Brandon", @g.guest.name
	  #assert_equal "Mike", @h.guest.name
    end
	
	#should "verify the invitations are correctly linking guest to party" do
	  #assert_equal ["Billy", "Bob"], @p1.guests.map{ |g| g.name }
	  #assert_equal ["Brandon", "Mike"], @p2.guests.map{ |g| g.name }
	#end
  end
end

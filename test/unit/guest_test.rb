require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  should belong_to(:host)
  should have_many(:invitations)
  should have_many(:parties).through(:invitations)
  
  # Validation macros...
  should validate_presence_of(:name)
  should validate_presence_of(:email)
  
   # ---------------------------------
  # Testing other methods with a context
  context "Creating two guests from two hosts" do
    # create the objects I want with factories
    setup do 
      @chris = Factory.create(:host, :first_name => 'Christian')
      @puja = Factory.create(:host, :first_name => 'Puja')
      @a = Factory.create(:guest, :name => 'Billy', :host => @puja)
	  @b = Factory.create(:guest, :name => 'Bob', :host => @puja)
	  @c = Factory.create(:guest, :name => 'Brandon', :host => @chris)
	  @d = Factory.create(:guest, :name => 'Mike', :host => @chris)
    end
    
    # and provide a teardown method as well
    teardown do
      @chris.destroy
      @puja.destroy
      @a.destroy
      @b.destroy
      @c.destroy
      @d.destroy
    end
  
    # now run the tests:
    # test one of each type of factory (not really required, but not a bad idea)
	should "show that the contexts are creating properly" do
      assert_equal "Christian", @chris.first_name
      assert_equal "Puja", @puja.first_name
      assert_equal "Billy", @a.name
	  assert_equal "Bob", @b.name
	  assert_equal "Brandon", @c.name
	  assert_equal "Mike", @d.name	  
    end
	
	should "have the guests listed in alphabetical order for hosts" do
	  assert_equal ["Billy", "Bob"], @puja.guests.map{ |g| g.name }
	  assert_equal ["Brandon", "Mike"], @chris.guests.map{ |g| g.name }
	end
  end
end

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  should belong_to(:party)
  should belong_to(:guest)
  should have_many(:gifts)
  
  # Validation macros...
  should validate_presence_of(:party_id)
  should validate_presence_of(:guest_id)
  should validate_presence_of(:expected_attendees)
  
  
end

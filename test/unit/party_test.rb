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
end

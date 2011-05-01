require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  should belong_to(:host)
  should have_many(:parties)
  
  # Validation macros...
  should validate_presence_of(:name)
  should validate_presence_of(:address)
end

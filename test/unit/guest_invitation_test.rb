require 'test_helper'

class GuestInvitationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GuestInvitation.new.valid?
  end
end

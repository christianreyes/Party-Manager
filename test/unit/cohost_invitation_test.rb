require 'test_helper'

class CohostInvitationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CohostInvitation.new.valid?
  end
end

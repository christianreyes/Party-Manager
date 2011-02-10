class GuestInvitation < ActiveRecord::Base
    attr_accessible :id, :party_id, :guest_id, :invited_by, :invite_code, :expected_attendees, :actual_attendees
end

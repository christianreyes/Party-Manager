class Gift < ActiveRecord::Base
    attr_accessible :id, :guest_invitation_id, :description, :note_sent_on
    
    belongs_to :guest_invitation
end

class GuestInvitation < ActiveRecord::Base
    attr_accessible :id, :party_id, :guest_id, :invited_by, :invite_code, 
    				:expected_attendees, :actual_attendees
    
    belongs_to :party
    belongs_to :guest, :dependent => :destroy
    belongs_to :user, :class_name => "User", :foreign_key => "invited_by"
    
    has_many :gifts, :dependent => :destroy
    #has_one :guest, :dependent => :destroy
    
    validates_presence_of :party_id, :guest_id
    
end

class GuestInvitation < ActiveRecord::Base
    attr_accessible :id, :party_id, :guest_id, :invited_by, :invite_code, 
    				:expected_attendees, :actual_attendees
    				
    before_create :generate_invite_code
    
    belongs_to :party
    belongs_to :guest
    belongs_to :user, :class_name => "User", :foreign_key => "invited_by"
    
    has_many :gifts, :dependent => :destroy
    
    scope :by_invite, lambda {|i| where(:invite_code >> i)}
    
    validates_presence_of :party_id, :guest_id
   
    def invite_url
    	return "/rsvp/" + invite_code
    end
    
    private 
    
    def generate_invite_code
    	self.invite_code = SecureRandom.hex(5)
    end 
    
end

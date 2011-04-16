class Invitation < ActiveRecord::Base
	belongs_to :party
	belongs_to :guest
	has_many :gifts, :dependent => :destroy
	
	before_create :generate_invite_code
	
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

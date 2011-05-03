class Invitation < ActiveRecord::Base
	belongs_to :party
	belongs_to :guest
	has_many :gifts, :dependent => :destroy
	
	before_create :generate_invite_code
	
	scope :by_invite_code, lambda {|i| where(:invite_code >> i)}
    
	validates :party_id, :presence => true, :numericality => true
	validates :guest_id, :presence => true, :numericality => true
	validates :expected_attendees, :presence => true, :numericality => { :only_integer => true, :greater_than => 0}
	validates :actual_attendees, :numericality => { :only_integer => true, :greater_than => 0, :allow_blank => true, :allow_nil => true}
	
    def invite_url
    	return "http://127.0.0.1:3000/rsvp/" + invite_code
    end
    
    private 
    
    def generate_invite_code
    	self.invite_code = SecureRandom.hex(5)
    end 
end
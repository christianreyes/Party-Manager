class Invitation < ActiveRecord::Base
	belongs_to :party
	belongs_to :guest
	has_many :gifts, :dependent => :destroy
	
	accepts_nested_attributes_for :guest
	
	before_create :generate_invite_code
	
	scope :by_invite_code, lambda {|i| where(:invite_code >> i)}
    
	validates :party_id, :presence => true
	validates :guest_id, :presence => true
	validates :expected_attendees, :presence => true, :numericality => { :integer_only => true, :greater_than => 0}
	
    def invite_url
    	return "/rsvp/" + invite_code
    end
    
    private 
    
    def generate_invite_code
    	self.invite_code = SecureRandom.hex(5)
    end 
end
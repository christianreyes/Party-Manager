class Invitation < ActiveRecord::Base
	belongs_to :party
	belongs_to :guest
	has_many :gifts, :dependent => :destroy
	
	before_create :generate_invite_code
	
	scope :all, order(:party_id.asc, :guest_id.asc)
	scope :by_invite_code, lambda {|i| where(:invite_code >> i)}
    
	validates :party_id, :presence => true
	validates :guest_id, :presence => true
	validates :expected_attendees, :presence => true, :numericality => { :only_integer => true, :greater_than => 0}
	validates :actual_attendees, :numericality => {:allow_nil => true, :only_integer => true, :allow_blank => true, }
	
    def invite_url
    	return "http://127.0.0.1:3000/rsvp/" + invite_code
    end
    
    private 
    
    def generate_invite_code
    	self.invite_code = SecureRandom.hex(5)
    end 
end
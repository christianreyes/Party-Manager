class Guest < ActiveRecord::Base
  attr_accessible :party_id, :name, :email, :invite_code, :expected_attendees, :actual_attendees
  
  before_create :generate_invite_code
  
  belongs_to :party
  belongs_to :host
  
  validates :party_id, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "Email is not a valid format." }
  validates :expected_attendees, :presence => true, :numericality => true
  
  def generate_invite_code
	self.invite_code = SecureRandom.hex(5)
  end 
end

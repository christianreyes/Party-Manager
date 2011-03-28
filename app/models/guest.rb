class Guest < ActiveRecord::Base
  attr_accessible :party_id, :name, :email, :invite_code, :expected_attendees, :actual_attendees
  
  belongs_to :party
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates :expected_attendees, :presence => true
end

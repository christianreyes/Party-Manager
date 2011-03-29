require 'Date'
class Party < ActiveRecord::Base
  attr_accessible :host_id, :name, :party_date, :location, :start_time, :end_time, :description, :rsvp_date
  
  belongs_to :host
  has_many :guests
  
  validates :name, :presence => true
  validates :party_date, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validate :party_date_before_now
  validate :end_time_after_start
  validate :rsvp_date_before_party_date
  
  def expected_attendance
	self.guests.sum('expected_attendees')
  end
  
  def actual_attendance
	self.guests.sum('actual_attendees')
  end
  
  def end_time_after_start
	errors.add :end_time, "End time must be after the start time" if end_time <= start_time
  end
  
  def party_date_before_now
	errors.add :party_date, "Party date must be on or after today." if rsvp_date && party_date < DateTime.now
  end
  
  def rsvp_date_before_party_date
	errors.add :party_date, "Rsvp date must be on or before the party date" if rsvp_date && rsvp_date > party_date
  end
  
  
end

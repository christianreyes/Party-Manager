class Party < ActiveRecord::Base
  attr_accessible :host_id, :name, :party_date, :location, :start_time, :end_time, :description, :rsvp_date
  
  belongs_to :host
  has_many :guests
  
  validates :name, :presence => true
  validates :party_date, :presence => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true
end

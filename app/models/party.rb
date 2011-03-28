class Party < ActiveRecord::Base
  attr_accessible :host_id, :name, :party_date, :location, :start_time, :end_time, :description, :rsvp_date
  
  belongs_to :host
  has_many :guests
end

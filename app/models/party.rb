class Party < ActiveRecord::Base
	belongs_to :host
	belongs_to :location
	has_many :invitations
	has_many :guests, :through => :invitations
	
	scope :all, order(:name.asc)
    scope :upcoming, where(:date > Date.yesterday).order(:date.asc)
    scope :past,     where(:date <= Date.yesterday).order(:date.desc)
	
	def number_expected_guests
		return self.guests.sum('expected_attendees')
	end
	
	def number_actual_guests
		return self.guests.sum('actual_attendees')
	end
end

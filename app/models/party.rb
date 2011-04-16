class Party < ActiveRecord::Base
	belongs_to :host
	belongs_to :location
	has_many :invitations
	has_many :guests, :through => :invitations
	
	scope :all, order(:name.asc)
    scope :upcoming, where(:date > Date.yesterday).order(:date.asc)
    scope :past,     where(:date <= Date.yesterday).order(:date.desc)
	scope :desc, order(:date.desc)
	
	validates :date, :presence => true, :date => {:after => Proc.new { Date.yesterday } }
	validates :name, :presence => true
	validate :proper_time
	validats :rsvp_date => {:after => Proc.new { Date.yesterday },
                                   :before => Proc.new { date} }
	validate :rsvp_date
	
	def date_not_past
		errors.add(:date, " must be today or after today") if date <= Date.yesterday
	end
	
	def rsvp_date_after_date
		errors.add(:rsvp_date, " must be equal to or less than the party date but after today") if rsvp_date > date || rsvp_date < Date.today
	end
	
	def proper_time
		errors.add(:end_time, " must be after start time") if end_time <= start_time
	end
	
	def number_expected_guests
		return self.guests.sum('expected_attendees')
	end
	
	def number_actual_guests
		return self.guests.sum('actual_attendees')
	end
end

class Party < ActiveRecord::Base
	belongs_to :host
	belongs_to :location
	has_many :invitations
	has_many :guests, :through => :invitations
	
	accepts_nested_attributes_for :invitations
	
	scope :all, order(:name.asc)
    scope :upcoming, where(:date > Date.yesterday).order(:date.asc)
    scope :past,     where(:date <= Date.yesterday).order(:date.desc)
	scope :desc, order(:date.desc)
	
	#validates :date, :presence => true, :date => {:after => Proc.new { Date.yesterday } }
	validates :name, :presence => true
	validates :date, :presence => true
	validates :start_time, :presence => true
	validates :end_time, :presence => true
	#validate :proper_time
	
	#def proper_time
	#	errors.add(:end_time, " must be after start time") if end_time <= start_time
	#end
	
	def number_expected_guests
		return self.guests.sum('expected_attendees')
	end
	
	def number_actual_guests
		return self.guests.sum('actual_attendees')
	end
end

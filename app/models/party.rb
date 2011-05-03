class Party < ActiveRecord::Base
	belongs_to :host
	belongs_to :location
	belongs_to :party_type
	has_many :invitations, :dependent => :destroy
	has_many :guests, :through => :invitations
	
	scope :all, order(:name.asc)
    scope :upcoming, where(:date > Date.yesterday).order(:date.asc)
    scope :past,     where(:date <= Date.yesterday).order(:date.desc)
	scope :desc, order(:date.desc)
	
	#validates :date, :presence => true, :date => {:after => Proc.new { Date.yesterday } }
	validates :name, :presence => true
	validates :date, :presence => true, :timeliness => { :type => :date}
	validates :rsvp_date, :timeliness => { :allow_nil => true, :on_or_before => :date, :type => :date }
	validates :start_time, :presence => true
	validates :end_time, :presence => true, :timeliness => { :after => :start_time, :type => :time }
	
	def number_expected_guests
		return self.guests.sum('expected_attendees')
	end
	
	def number_actual_guests
		return self.guests.sum('actual_attendees')
	end
end

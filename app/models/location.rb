class Location < ActiveRecord::Base
	belongs_to :host
	has_many :parties, :dependent => :nullify
	
	before_save :save_coordinates
	
	validates :name, :presence => true
	validates :address, :presence => true
	
	scope :all, order(:name.asc)
	
	def save_coordinates
		coord = Geokit::Geocoders::GoogleGeocoder.geocode "#{address}"
		if coord.success
			self.latitude, self.longitude = coord.ll.split(',')
		else
			errors.add_to_base("Error with geocoding")
		end
	end
	
	def google_map_link(width = 430, height = 360, zoom = 13)
		markers = "&markers=color:red%7Ccolor:red%7Clabel:#{"1"}%7C#{latitude},#{longitude}"
		"http://maps.google.com/maps/api/staticmap?center=#{latitude},#{longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
	end
end

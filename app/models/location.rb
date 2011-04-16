class Location < ActiveRecord::Base
	belongs_to :host
	has_many :parties
	
	before_save :save_coordinates
	
	def save_coordinates
		coord = Geokit::Geocoders::GoogleGeocoder.geocode "#{address}"
		if coord.success
			self.latitude, self.longitude = coord.ll.split(',')
		else
			errors.add_to_base("Error with geocoding")
		end
	end
end

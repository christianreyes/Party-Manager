class Location < ActiveRecord::Base
	belongs_to :host
	has_many :parties
end

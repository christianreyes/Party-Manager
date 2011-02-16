class Location < ActiveRecord::Base
    attr_accessible :id, :name, :street, :city, :state, :zip, :latitude, :longitude, :description
    
    has_many :parties
    has_many :guests
    has_many :users
    
    validates_presence_of :name, :latitude, :longitude
end

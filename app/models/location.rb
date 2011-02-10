class Location < ActiveRecord::Base
    attr_accessible :id, :name, :street, :city, :state, :zip, :latitude, :longitude, :description
end

class Guest < ActiveRecord::Base
    attr_accessible :id, :name, :email, :location_id, :notes
end

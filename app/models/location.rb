class Location < ActiveRecord::Base
    attr_accessible :id, :name, :street, :city, :state, :zip, :latitude, :longitude, :description
    
    has_many :parties
    has_many :guests
    has_many :users
    
    validates_presence_of :name
    
    def address
    	str = String.new
    	str = comma_add(str, street)
    	str = comma_add(str, city)
    	str = comma_add(str, state)
    	if(zip)
    		if(str.length > 0)
    		str+= " "
    		end
    		str += zip
    	end
    	
    	return str
    end
    
    def comma_add(str, add)
    	if(add)
    		if(str.length>0)
    			str += ', '
        	end
        	str += add
        end
        
        return str
    end
    
    def google_map_url(size)
    	string =  "http://maps.google.com/maps/api/staticmap?"
    	string += "&zoom=14&size="
    	string += size
    	string += "&markers=size:mid|color:red|"
    	string += address
    	string += "&sensor=false"
    	return string
    end
end

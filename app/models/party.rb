class Party < ActiveRecord::Base
    attr_accessible :id, :name, :user_id, :details, :party_type_id, :date, 
    					  :start_time, :end_time, :rsvp_date, :location_id, :public_party, :public_guestlist
	
    #=====================
    # Relationships
    #=====================
    
    has_many :guest_invitations
    has_many :guests, :through => :guest_invitations	
	
	belongs_to :party_type
	belongs_to :location
	belongs_to :user
 
    #=====================
    # Scopes
    #=====================
    
    
    #=====================
    # Validation
    #=====================	
	
    

end

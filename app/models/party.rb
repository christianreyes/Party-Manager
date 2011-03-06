class Party < ActiveRecord::Base
    attr_accessible :id, :name, :user_id, :details, :party_type_id, :date, 
    					  :start_time, :end_time, :rsvp_date, :location_id, :public_party, :public_guestlist
	
    #=====================
    # Relationships
    #=====================
    
    has_many :guest_invitations, :dependent => :destroy
	
	#accepts_nested_attributes_for :guest, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	
	belongs_to :party_type
	belongs_to :location
	belongs_to :user
 
    #=====================
    # Scopes
    #=====================
    
    
    #=====================
    # Validation
    #=====================	
	
    def guests
    	g = []
    	guest_invitations.each do |gi|
    		g.insert(0,gi.guest)
    	end
    	
    	return g
    end

end

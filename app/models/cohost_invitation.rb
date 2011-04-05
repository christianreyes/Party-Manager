class CohostInvitation < ActiveRecord::Base
    attr_accessible :id, :party_id, :user_id, :invite_name, :invite_email, :invite_code, :agree  
    
    #=====================
    # Relationships
    #=====================
    belongs_to :party
    belongs_to :user
 
    #=====================
    # Scopes
    #=====================
    
    
    
    #=====================
    # Validation
    #=====================
end
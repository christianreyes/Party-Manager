class Guest < ActiveRecord::Base
    attr_accessible :id, :name, :email, :location_id, :notes, :user_id
       
    has_many :guest_invitations
    has_many :parties, :through => :guest_invitations
    has_many :gifts,   :through => :guest_invitations
    
    belongs_to :location
    belongs_to :user
    
    scope :all, order(:name.asc)
    
end

class Guest < ActiveRecord::Base
    attr_accessible :id, :name, :email, :notes, :host_id
       
    has_many :guest_invitations, :dependent => :destroy
    has_many :parties, :through => :guest_invitations
    has_many :gifts,   :through => :guest_invitations,  :dependent => :destroy
    
    belongs_to :user, :class_name => "User", :foreign_key => "host_id"
    
    scope :all, order(:name.asc)
    
end

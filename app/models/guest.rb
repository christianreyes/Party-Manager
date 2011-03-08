class Guest < ActiveRecord::Base
    attr_accessible :id, :name, :email, :notes, :host_id
       
    has_many :guest_invitations, :dependent => :destroy
    has_many :parties, :through => :guest_invitations
    has_many :gifts,   :through => :guest_invitations,  :dependent => :destroy
    
    belongs_to :user, :class_name => "User", :foreign_key => "host_id"
    
    scope :all, order(:name.asc)
    
    validates_presence_of :name, :email
    
    validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
    validates_uniqueness_of :email
    
end

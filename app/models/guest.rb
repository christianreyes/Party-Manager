class Guest < ActiveRecord::Base
	belongs_to :host
	has_many :invitations, :dependent => :destroy
	has_many :parties, :through => :invitations
	
	validates_uniqueness_of :name
	
	scope :all, order(:name.asc)
end

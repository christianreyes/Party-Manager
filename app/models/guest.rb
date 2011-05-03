class Guest < ActiveRecord::Base
	belongs_to :host
	has_many :invitations, :dependent => :destroy
	has_many :parties, :through => :invitations
	
	scope :all, order(:name.asc)
	
	validates :name, :presence => true
	validates :email, :presence => true, :format => {:with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ , :message => "is not a valid format" }
end

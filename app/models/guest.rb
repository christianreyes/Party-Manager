class Guest < ActiveRecord::Base
	belongs_to :host
	has_many :invitations
	has_many :parties, :through => :invitations
end

class Party < ActiveRecord::Base
	belongs_to :host
	belongs_to :location
	has_many :invitations
	has_many :guests, :through => :invitations
end

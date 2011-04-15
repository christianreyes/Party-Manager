class Invitation < ActiveRecord::Base
	belongs_to :party
	belongs_to :guest
	has_many :gifts
end

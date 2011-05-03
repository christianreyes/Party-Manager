class PartyType < ActiveRecord::Base
	has_many :parties, :dependent => :nullify
end

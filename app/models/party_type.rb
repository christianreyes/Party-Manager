class PartyType < ActiveRecord::Base
    attr_accessible :id, :name, :active
    
    has_many :parties
    
    scope :all, order(:name.asc)
end

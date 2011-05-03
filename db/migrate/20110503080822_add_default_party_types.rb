class AddDefaultPartyTypes < ActiveRecord::Migration
  def self.up
	PartyType.create :name => "Birthday"
    PartyType.create :name => "Wedding"
	PartyType.create :name => "Baby Shower"
	PartyType.create :name => "General Party"
	
	puts "\n============================"
	puts "Created default party types:"
	puts "\nBirthday\nWedding\nBaby Shower\nGeneral Party\n"
	puts "============================\n"
  end

  def self.down
  end
end

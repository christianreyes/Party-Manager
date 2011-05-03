class AddDefaultUser < ActiveRecord::Migration
  def self.up	
	a = Host.new(:username => "MrsH",
				:email => "mrsheimann@gmail.com",
				:password => "alex&mark",
				:password_confirmation => "alex&mark",
				:first_name => "An",
				:last_name => "Heimann")
	a.save!
				
	puts "\n======================"
	puts "Created default host:"
	puts "\nusername: MrsH"
	puts "password: alex&mark\n"
	puts "======================\n"
  end

  def self.down
  end
end

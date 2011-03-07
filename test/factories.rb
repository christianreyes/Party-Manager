# FACTORIES FOR PARTY MANAGER

# Begin with the User class
  Factory.define :user do |u|
    # if we create multiple users, automatically add a incremented number
    # by using the sequence method since login must be unique
    u.sequence(:login) { |n| "fred_#{n}" }   
    # specify a default (and awesome) password
    u.password "fred_lives"  
    # copy the password (default or otherwise) for confirmation
    u.password_confirmation { |u| u.password }  
    # as above, automatically add a incremented number to email prefix
    u.sequence(:email) { |n| "fred#{n}@example.com" }
  end

# Create factory for PartyType class

  Factory.define :party_type do |t|
    t.name   "Code Party!"
	t.active true
  end
  
# Create factory for Location class
# :name, :street, :city, :state, :zip, :latitude, :longitude, :description, :host_id
  Factory.define :location do |l|
    l.name   "The White House"
	l.street "1600 Pennsylvania Avenue NW"
	l.city   "Washington"
	l.state  "DC" 
	l.zip    "20500"
  end
  
# Create factory for Party class
#  Factory.define :party do |p|
#    # your code here
#    p.name       "My super fun party!"
#    p.party_type PartyType.find_by_name("General Party")
#	p.date = 1.month.from_now
#    c.active true
#  end

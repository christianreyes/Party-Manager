require 'time'
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
	#l.association :user
  end
  
  #Create factory for Party class
  #Factory.define :party do |p|
  #  p.name       "My super fun party!"
  #  p.details "This party is going to be SOOOOO fun!"
  #  p.start_time 1.hour.from_now
  #  p.end_time 2.hours.from_now
  #	p.date  2.months.from_now
  #	p.rsvp_date  1.month.from_now
	#p.public_party true
	#p.public_guestlist true
	#p.association :party_type
	#p.association :location
	#p.assocation :user
  #end
  
#  Factory.define :guest do |g|
 # 	g.name  "Billy Bob"
  #	g.email "billy@bob.com"
  	#g.notes "He is a sneaky one. Look out for him"
  	#g.association :user
  #end
  
  #Factory.define :guest_invitation do |g|
  #	g.expected_attendees 5
  #	g.association :guest
  #	g.association :party
  #end
  
  #Factory.define :gift do |g|
  #	g.description "A gold watch"
  	#g.association :guest_invitation
  #end

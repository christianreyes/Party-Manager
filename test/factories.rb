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

  
# Create factory for Party class
  Factory.define :party do |p|
    # your code here
    p.name = "My super fun party!"
    p.party_type = PartyType.find_by_name("General Party")
	p.date = 1.month.from_now
	p.
    c.active true

  end

# Create factory for Task class
  Factory.define :task do |t|
    # your code here
    t.name "Rake the leaves"
    t.points 3
    t.active true

  end

# Finally make a factory for Chore class
  Factory.define :chore do |c|
    # just add the association to cover child_id
    c.association :child
    # just add the association to cover task_id
    c.association :task  
    # make the chore due 2 days into the future
    c.due_on 2.days.from_now
    # assume it is not yet complete
    c.completed false  
  end

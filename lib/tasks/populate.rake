# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Location, Invitation, Guest, Party].each(&:destroy_all)
	
	puts "Destroyed all Location, Invitation, Guest, Party"
	
	t = Host.where(:username => "MrsH").first
	#if t.nil? 
	#	t = Host.new
	#	t.first_name = "Party"
	#	t.last_name = "Tester"
	#	t.username = "test"
	#	t.email = "test@test.com"
	#	t.password = "test"
	#	t.save!
	#end
    
    cmu = Location.new
    cmu.host_id = t.id
    cmu.name = "Carnegie Mellon University"
    cmu.address = "5032 Forbes Ave, Pittsburgh, PA 15213"
    cmu.save!
	
	5.times do
		p = Party.new
		p.name = Faker::Company.bs.capitalize.slice(0..25)
		p.location_id = cmu.id
		if rand < 0.5
			p.date = rand(30).days.from_now
		else
			p.date = (-rand(30)).days.from_now
		end
		p.start_time = Time.now
		p.end_time = Time.now + 1.hour
		p.rsvp_date = p.date - rand(30).days
		p.description = Faker::Lorem.paragraphs(3)
		p.host_id = t.id
		p.public_guestlist = rand > 0.5
		p.save!
		
		n = (5 + rand(5))
		n.times do 
			g = Guest.new
			g.name = Faker::Name.name
			g.email = Faker::Internet.free_email(g.name)
			g.notes = Faker::Lorem.sentence
			g.host_id = t.id
			g.save!
			
			i = Invitation.new
			i.party_id = p.id
			i.guest_id = g.id
			i.expected_attendees = 1 + rand(6)

			if rand <0.5
				i.actual_attendees = rand(i.expected_attendees)
			else
				i.actual_attendees = i.expected_attendees
			end

			i.save!
		end
		puts "Created party: #{p.name}, Invited #{n} guests"
	end
	
  end
end
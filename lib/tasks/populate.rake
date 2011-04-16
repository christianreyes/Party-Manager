# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Location, Invitation, Guest, Party].each(&:destroy_all)
	
	puts "Destroyed all Location, Invitation, Guest, Party"
    
	c = Host.all.select { |u| u.username == "trogrey121"}.first
    
    cmu = Location.new
    cmu.host_id = c.id
    cmu.name = "Carnegie Mellon University"
    cmu.address = "5032 Forbes Ave, Pittsburgh, PA 15213"
    cmu.save!
	
	10.times do
		p = Party.new
		p.name = Faker::Company.bs.capitalize.slice(0..25)
		p.location_id = cmu.id
		if rand < 0.5
			p.date = rand(30).days.from_now
		else
			p.date = (-rand(30)).days.from_now
		end
		p.start_time = p.date + rand(10).hours
		p.end_time = p.start_time + rand(5).hours
		p.rsvp_date = p.date - rand(30).days
		p.description = Faker::Company.bs * 3
		p.host_id = c.id
		p.save!
		
		t = (5 + rand(10))
		t.times do 
			g = Guest.new
			g.name = Faker::Name.name
			g.email = Faker::Internet.free_email(g.name)
			g.notes = Faker::Lorem.sentence
			g.host_id = c.id
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
		puts "Created party: #{p.name}, Invited #{t} guests"
	end
	
  end
end
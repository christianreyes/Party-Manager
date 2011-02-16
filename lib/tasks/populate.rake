# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Location, Guest, Party, PartyType].each(&:delete_all)
    
    Location.populate 20 do |loc|
      loc.name          = Faker::Name.name
      loc.street        = Faker::Address.street_address
      loc.city          = Faker::Address.city
      loc.state         = Faker::Address.us_state_abbr
      loc.zip           = Faker::Address.zip_code
      loc.description   = Faker::Lorem.sentence(10)
      loc.latitude      = rand() * 90
      loc.longitude     = rand() * 90
    end    
    
    b = PartyType.new
    b.name = "Birthday Party"
    b.save! 
    
    b = PartyType.new
    b.name = "Wedding Celebration"
    b.save!     
    
    b = PartyType.new
    b.name = "New Year's Party"
    b.save! 
   
  end
end
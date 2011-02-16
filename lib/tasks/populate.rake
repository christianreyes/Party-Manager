# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Location, Guest, Party].each(&:delete_all)
    
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
    
   
  end
end
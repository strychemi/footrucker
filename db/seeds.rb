# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@truckAPI = SfodAPI.new

def populate_trucks
  puts "Resetting Food Truck Database"
  Truck.destroy_all

  puts "Making API Call"
  @truckAPI.get_json_response
  @truckAPI.get_only_approved
  approved = @truckAPI.approved

  puts "Populating Database with Food Truck Info"
  approved.each do |a|
    print "."
    t = Truck.new
    t.name = a["applicant"]
    t.address = a["address"]
    if a["location"]
      t.location_description = a["location"]["locationdescription"]
      t.longitude = a["location"]["longitude"]
      t.latitude = a["location"]["latitude"]
    end
    t.foods = a["fooditems"]
    t.schedule = a["dayshours"]
    t.save
  end
  puts
  puts "Truck Info Done Populating!"
end

populate_trucks

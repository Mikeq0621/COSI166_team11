# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Host.delete_all 
User.delete_all
Listing.delete_all 
Transaction.delete_all

hosts = Array.new
users = Array.new
listings = Array.new
transactions = Array.new
(1..50).each do
    boston_zipcodes = ["02045","02108","02109","02110","02111","02136","02453"]
    longitude_lst = [ "-70.958632", "-71.008632", "-71.058632", "-71.158632", "-71.258632", "-71.358632"]
    lasitude_lst = ["42.258990", "42.358990", "42.458990", "42.558990", "42.668990"]

    # Host info
    host_name = Faker::Name.name
    host_email = Faker::Internet.email
    host_pass = Faker::Internet.password
    host_pn = Faker::PhoneNumber.cell_phone
    host_address = Faker::Address.street_address
    host_city = Faker::Address.city
    host_zip = boston_zipcodes.sample
    host_state = Faker::Address.state
    host_longitude = longitude_lst.sample
    host_latitude = lasitude_lst.sample
    # User Info
    user_name = Faker::Name.name
    user_email = Faker::Internet.email
    user_pass = Faker::Internet.password
    user_pn = Faker::PhoneNumber.cell_phone
    user_address = Faker::Address.street_address
    user_city = Faker::Address.city
    user_zip = boston_zipcodes.sample
    user_state = Faker::Address.state
    user_longitude = longitude_lst.sample
    user_latitude = lasitude_lst.sample



    hosts << Host.new(name: host_name, email: host_email, password: host_pass, password_confirmation: host_pass,
                      phone_number: host_pn, address: host_address, city: host_city, zip_code: host_zip, state: host_state, 
                      longitude: host_longitude, latitude: host_latitude)

    #users << User.new(name: user_name, email: user_email, password: user_pass, password_confirmation: user_pass,
                        #phone_number: user_pn, address: user_address, city: user_city, zip_code: user_zip, state: user_state, 
                        #longitude: user_longitude, latitude: user_latitude)
end

Host.import hosts
#User.import users

25.times do
    h_id = Host.all.sample.id
    host = Host.find(h_id)
    listings << Listing.new(host_id:h_id, space: rand(3..10), duration: rand(2..26) )
end

Listing.import listings


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
    host_name = Faker::Name.name
    user_name = Faker::Name.name
    
    host_email = Faker::Internet.email
    user_email = Faker::Internet.email
    
    host_pass = Faker::Internet.password
    user_pass = Faker::Internet.password

    host_pn = Faker::PhoneNumber.cell_phone
    user_pn = Faker::PhoneNumber.cell_phone

    host_address = Faker::Address.street_address
    host_city = Faker::Address.city
    host_zip = boston_zipcodes.sample

    hosts << Host.new(name:host_name,email:host_email,password:host_pass,password_confirmation:host_pass,phone_number:host_pn,address:host_address,city:host_city,zip_code:host_zip)
    users << User.new(name:user_name,email:user_email,password:user_pass,password_confirmation:user_pass,phone_number:user_pn)
    
end

Host.import hosts
User.import users


25.times do
    listings << Listing.new(host_id:Host.all.sample.id, space: rand(3..10), duration: rand(2..26) )
end
Listing.import listings

15.times do
    transactions << Transaction.new(host_id:Host.all.sample.id, user_id:User.all.sample.id, price:Faker::Commerce.price, duration: rand(2..26) )
end
Transaction.import transactions
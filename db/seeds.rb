# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hosts = Array.new
users = Array.new
(1..50).each do
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
    host_zip = Faker::Address.zip_code

    hosts << Host.new(name:host_name,email:host_email,password:host_pass,phone_number:host_pn,address:host_address,city:host_city,zip_code:host_zip)
    users << User.new(name:user_name,email:user_email,password:user_pass,phone_number:user_pn)
end

Host.import hosts
User.import users
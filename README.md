# COSI166b Team11 : AirStorage Stage 3

Hello, World! version of our team project.

Has basic function to display all user and hosts in database. Also has a simple search function on the user's input zipcode in a from in nav bar.

Deploy to heroku: https://airstorage.herokuapp.com/

## Requirements: 
    1. Ruby 2.7.2
    2. rails 6.1.3
<br>

## Database creation
    Tables:
    
    Name: Hosts 
    Columns: integer id, string name, string email, string password, string phone_number, string address, 
    string city, integer zip_code

    Name: Users 
    Columns: integer id, string name, string email, string password, string phone_number

    Name: Transactions
    Columns: integer id, integer host_id, integer user_id, float price, integer duration

    Name: Listings
    Columns: integer id, integer host_id, integer space, integer available_duration

    Associations:
    Hosts -> Listings (One to Many)
    Hosts -> Transactions is (One to Many)
    Users -> Transactions is (One to Many)
<br>

## Hello World functionalities
1. Basic layout for home page, faq page, and pages displaying user info.

2. Nav bar _User_, _Hosts_, _Listings_, _Transactions_ will display all users, hosts, listings, and transactions in database. The Listing table contains infomation about spaces each host has, time available, etc. Transcation will be used as association between user and host in further development.

3. Search function in a form in nav bar. Based on the user's input zipcode, it will display a list of hosts that have the same zip code. For demostrations purpose, try search "17070". Since databse is populated on random, some zip code will not have a match in DB.

4. Some links are left blank as a apart of layout. They will be used for future delevelopment purpose.
<br>

## HomePage
![screen shot](Home.png)

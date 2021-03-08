# AirStorage Cosi166 Team 11 Stage2

Hello, World! version of our team project.

Has  basic function to display all user and hosts in database. Also has a simple search function on the user's input zipcode.

Deploy to heroku: https://airstorage.herokuapp.com/

## Requirements: 
    1. Ruby 2.7.2
    2. rails 6.1.3

## System dependencies
<br>
<br>
<br>

## Configuration
<br>
<br>
<br>

## Database creation
    Tables:
    
    Name: Hosts 
    Columns: integer id, string name, string email, string password, string phone_number, string address, 
    string city, integer zip_code

    Name: Users 
    Columns: integer id, string name, string email, string password string phone_number

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
1. Nav bar _User_, _Hosts_ will display all users and hosts in database.
2. Basic search functionality. Based on the user's input zipcode, will display a list of hosts that have the zip code.
<br>

## HomePage
![screen shot](Home.png)

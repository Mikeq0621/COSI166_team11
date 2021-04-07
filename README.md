<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/Mikeq0621/COSI166_team11">
    <img src="AirStorageIcon.png" alt="Logo" width="80" height="80">
  </a>
  <h1 align="center">Team 11: AirStorage</h1>
  <p align="center">
    COSI 166b Term Project Stage 3
    <br/>
  </p>
</p>

<!-- ABOUT AIRSTORAGE -->
## About AirStorage: 

AirStorage is an user-driven online marketplace for storage space rental services. Members of the website are divided into Users and Hosts. Users can 
find listings for places offering storage space for their belongings and Hosts can rent out any extra space in their residences for a certain time period. 

Currently, visitors to AirStorage can do the following:
* Create an account or log in as either a User or a Host
* Hosts can post listings for the storage space(s) they are renting out
* Users can find search for listings and filter their results based on location, storage space size, and duration
* Users can rent listings being offered
* Visitors can view available result options on interactive map

Link: https://airstorage.herokuapp.com/

<!-- BUILT USING -->
## Built using: 
    Ruby 2.7.2
    Rails 6.1.3
    Bootstrap 3.41

### Gems, APIs, and Libraries:
    MapBox
    Noticed
    Activerecord-import
    Json
    Better_errors
    Pry-rails
    Bycrypt
    Geocoder

## Database Schema
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


## HomePage
![screen shot](Home.png)

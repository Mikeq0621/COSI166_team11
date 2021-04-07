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

![screen shot](Home.png)

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
* [Ruby 2.7.2](https://www.ruby-lang.org/en/downloads/)
* [Rails 6.1.3](https://rubyonrails.org)
* [Bootstrap 3.4.1](https://getbootstrap.com)

### Gems, APIs, and Libraries:
    MapBox
    Noticed
    Activerecord-import
    Json
    Better_errors
    Pry-rails
    Bycrypt
    Geocoder

<!-- DATABASE SCHEMA -->
## Database Schema

<b> Tables </b>
    
    Name: Hosts 
    Columns: integer id, string name, string email, string password_digest, string phone_number, string address, 
    string city, text zip_code, datetime created_at, datetime updated_at, decimal longitude, decimal latitude, 
    string state

    Name: Users 
    Columns: integer id, string name, string email, string password_digest, string phone_number, datetime created_at,
    datetime updated at, decimal longitude, decimal latitude, string state, string city, string address,
    text zipcode

    Name: Transactions
    Columns: integer id, integer host_id, integer user_id, float price, integer duration, datetime created_at,
    datetime updated_at, integer listing_id

    Name: Listings
    Columns: integer id, integer host_id, integer space, integer available_duration, datetime created_at,
    datetime updated_at
    
    Name: Requests
    Columns: integer id, bigint host_id, bigint listing_id, bigint user_id, available_duration,
    datetime created_at, datetime updated_at, index index_requests_on_host_id, index index_requests_on_listings_id,
    index index_requests_on_user_id

    Associations:
    Hosts -> Listings (One to Many)
    Hosts -> Transactions is (One to Many)
    Users -> Transactions is (One to Many)

<!-- URL PATH-->
## URL PATH
<b>Home page:</b> / <br>    
<b>Users urls:</b> /users, /users/new, /users/create, /users/delete, /users/:id <br>
<b>Hosts urls:</b> /hosts, /hosts/new, /hosts/create, /hosts/delete, /hosts/:id <br>
<b>Login as user:</b> /userlogin <br>
<b>Login as host:</b> /hostlogin <br>
<b>Display user profile:</b> /userprofile <br>
<b>Display host profile:</b> /hostprofile <br>
<b>Listings url:</b> /listings, /listings/new, /listings/create, /listings/delete, /listings/:id
<b>Transactions url:</b> /transactions, /transactions/new, /transactions/create, /transactions/delete
<b>Requests url:</b> <br>
        create a request -> /rent/:listing_id <br>
	accept a request -> /accept/:req_id <br>
	decline a request -> /deny/:req_id	   
<b>Search form:</b> /search <br>
<b>Display search results by different filters:</b> /search?search=3&search_filter=box<br>
/search?search=3&search_filter=city
/search?search=3&search_filter=duration
/search?search=3&search_filter=location <br>
<b>FAQ page:</b> /static_page/faq <br>
<b>Logout:</b> /logout <br>


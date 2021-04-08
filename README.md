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

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-airstorage">About AirStorage</a>
    </li>
    <li>
      <a href="#built-using">Built Using</a>
      <ul>
        <li><a href="#gems-apis-and-libraries">Gems, APIs, and Libraries</a></li>
      </ul>
    </li>
    <li><a href="#navigating-airstorage">Navigating AirStorage</a></li>
    <li><a href="#database-schema">Database Schema</a></li>
    <li><a href="#url-paths">Url Paths</a></li>
  </ol>
</details>

<!-- ABOUT AIRSTORAGE -->
## About AirStorage: 

![screen shot](Home.png)

AirStorage is an user-driven online marketplace for storage space rental services. Members of the website are divided into Users and Hosts. Users can 
find listings for places offering storage space for their belongings and Hosts can rent out any extra space in their residences for a certain time period. 

Currently, visitors to AirStorage can do the following:
* Create an account or log in as either a User or a Host
* Hosts can post listings for the storage space(s) they are renting out
* Users can search for listings and filter their results based on location, storage space size, and duration
* Users can rent listings being offered
* Visitors can view available result options on interactive map

Link: https://airstorage.herokuapp.com/

<!-- BUILT USING -->
## Built Using: 
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

<!-- NAVIGATING AIRSTORAGE -->
## Navigating AirStorage

At this moment, we have implemented many of the pages we intend to use in the final release of AirStorage. Prototypes for modifications and additions
to the views can be found in the "UI_Prototypes" folder in our github repository. <br>

Clicking the website link brings the visitor to the home page, where there is an option to sign up as either an User or Host. If they already have an account,
they can log in using the option on the header, which also contains the search bar and filter, and links to the member's account, listings, host
list, FAQ and log out upon a succesful log in. Upon logging in or signing up, the member is brought the home page, which then contains the option to find places 
to rent for Users and the option to rent space out for Hosts. <br>

The members' profile pages contains their personal details and records for recent transactions and pending requests. The Hosts' profile pages also shows
their list of listings that they are offering.<br>

![screen shot](AirStorageMap.png) 

Users can find listings being offered by hosts using the search bar or by clicking the Listings link. Both options brings the User to the interactive map, with the 
latter option showing all listings. The storage spaces being offered are represented using pins and clicking on a pin brings up a relevant renting option. If the 
User selects that, it brings them to another page to confirm their renting, upon which the rent request is added to the User's and Host's pending requests.

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

<!-- URL PATHS-->
## URL Paths
<b>Home page:</b> /  
<b>Users urls:</b> /users, /users/new, /users/create, /users/delete, /users/:id <br>
<b>Hosts urls:</b> /hosts, /hosts/new, /hosts/create, /hosts/delete, /hosts/:id <br>
<b>Login as user:</b> /userlogin <br>
<b>Login as host:</b> /hostlogin <br>
<b>Display user profile:</b> /userprofile <br>
<b>Display host profile:</b> /hostprofile <br>
<b>Listings url:</b> /listings, /listings/new, /listings/create, /listings/delete, /listings/:id <br>
<b>Transactions url:</b> /transactions, /transactions/new, /transactions/create, /transactions/delete <br>
<b>Requests url:</b>  <br>
create a request -> /rent/:listing_id, <br>
accept a request -> /accept/:req_id, <br>
decline a request -> /deny/:req_id	   
<b>Search form:</b> /search <br>
<b>Display search results by different filters:</b> <br>
/search?search=3&search_filter=box, <br>
/search?search=3&search_filter=city, <br> 
/search?search=3&search_filter=duration, <br>
/search?search=3&search_filter=location <br>
<b>FAQ page:</b> /static_page/faq <br>
<b>Logout:</b> /logout <br>


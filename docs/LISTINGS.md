<p align="center">
  <a href="https://mikeq0621.github.io/COSI166_team11/">
    <img src="../app/assets/images/AirStorageIcon2.png" alt="Logo" width="80" height="80">
  </a>
  <h1 align="center">Listings Map</h1>
  <p align="center">
    COSI 166b Term Project
    <br>
    <a href="https://airstorage.herokuapp.com/">Heroku Deployment</a>
    <br>
    <a href="https://github.com/Mikeq0621/COSI166_team11">Github Repository</a>
    <br>
    <a href="https://mikeq0621.github.io/COSI166_team11/">Back to Github page</a>
  </p>
</p>

# General Functionality
The listings map is one of the main features of our website. It is the only tool that connects users to hosts, so its functionality was a key part of this app. The general functionality of the map heavily relies on javascript and ajax. When a user of host enters the Listings tab in our website, the map will center around the current users location, and show them nearby available listings for storage as red markers. Simiarly, the listings catalog on the left shows the available listings sorted by distance. The red markers in the map are all linked to a listing item on the catalog on the left. Each listing item and marker have listeners that, in the case the user clicks on either one, it will scroll through the listings catalog on the left and highlight the appropiate listing, as well as fly to its corresponding marker on the map. This is all done with Ajax so the user does not have to refresh the page, and changes are made on the spot. Marker and listing items can be "active" or not, so when a user clicks a different item, previous items becomes inactive and only the clicked item becomes active. This is just the basic functionality, more details can be found below.

## Use of Geocoder
Geocoder was an essential tool for us to correctly pinpoint hosts/users locations in order to display listings and locate nearby locations. When a user or host sign up, their address is converted into a coordinate (longitude and lattitude) which is then used to display and sort nearby listings. Geocoder is also used to implement the search bar on the top right of the map. Based on the user's coordinates, when something is typed in the search bar the suggestions that pop in the bottom are based on nearby locations using Geocoder. So for example, if I am in Waltham and start typing "Brook..." the search bar will likely suggest "Brookline", since its a close city to Waltham, rather than suggesting "Brooklyn" in New York. Geocoder also has the capability of calculating the distance between two points, which is what we use to caluclate the distance of a user to other locations.

## Filtering
We can use the filter button in the listings menu to specify any features we want to filter out. A user can filter based on how much minimum space or duration they want, how much they are willing to pay or how far they are willing to travel. Filtering is also done using Ajax, the Apply Filters button has a listener that when clicked on will delete the listing menu on the left of the page(all markers and popups are hidden) and construct a new listing catalog based on the user's specifications. If the reset button is clicked, then the listings catalog is reset to it's original form. In any way, the results on the listings catalog are always sorted by nearby distance. Although this method of filtering might not be the most effecient, since we have to constantly destroy and re-construct the lists, it was the easiest way for us to avoid bugs from lingering listings that don't get filtered out. 


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
The listings map is one of the main features of our website. It is the only tool that connects users to hosts, so its functionality was a key part of this app. The general functionality of the map heavily relies on javascript and ajax. When a user of host enters the Listings tab in our website, the map will center around the current users location, and show them nearby available listings for storage as red markers. Simiarly, the listings catalog on the left shows the available listings sorted by distance. The red markers in the map are all linked to a listing item on the catalog on the left. Each listing item and marker have listeners that, in the case the user clicks on either one, it will scroll through the listings catalog on the left and highlight the appropiate listing, as well as fly to its corresponding marker on the map. This is all done with Ajax so the user does not have to refresh the page, and changes are made on the spot. Marker and listing items can be "active" or not, so when a user clicks a different item, previous items becomes inactive and only the clicked item becomes active.



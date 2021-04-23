/* This will let you use the .remove() function later on */
  if (!('remove' in Element.prototype)) {
    Element.prototype.remove = function () {
      if (this.parentNode) {
        this.parentNode.removeChild(this);
      }
    };
  }

  mapboxgl.accessToken = 'pk.eyJ1IjoiZmVkZTEwIiwiYSI6ImNrbXFuOHZoNjA5YWYycnBrbnlva3BreXQifQ.dfsLU-Ej4EZipT-BCrp7IQ';

  /**
   * Add the map to the page
   */
var longitude = $('.listings').data('longitude');
var latitude = $('.listings').data('latitude');
  var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [longitude ,latitude],
    zoom: 13,
  });
        
  var listings = $('.listings').data('listings');

  /**
   * Assign a unique id to each store. You'll use this `id`
   * later to associate each point on the map with a listing
   * in the sidebar.
   */
  listings.features.forEach(function (store, i) {
    store.properties.id = i;
  });
var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl,
    flyTo: {
        zoom: 12 // If you want your result not to go further than a specific zoom
      },
    placeholder: 'Search for address or city', // Placeholder text for the search bar
    //bbox: [-122.30937, 37.84214, -122.23715, 37.89838], // Boundary for Berkeley
    proximity: {
    longitude: longitude,
    latitude: latitude
    },
    });
    
map.addControl(geocoder);

  /**
   * Wait until the map loads to make changes to the map.
   */
  map.on('load', function (e) {
    /**
     * This is where your '.addLayer()' used to be, instead
     * add only the source without styling a layer
     */
    map.addSource('places', {
      'type': 'geojson',
      'data': listings
    });

    /**
     * Add all the things to the page:
     * - The location listings on the side of the page
     * - The markers onto the map
     */
    var options = { units: 'miles' };
    listings.features.forEach(function(listing) {
        Object.defineProperty(listing.properties, 'distance', {
        value: turf.distance([longitude, latitude], listing.geometry, options),
        writable: true,
        enumerable: true,
        configurable: true
        });
    });
    listings.features.sort(function(a, b) {
      if (a.properties.distance > b.properties.distance) {
        return 1;
      }
      if (a.properties.distance < b.properties.distance) {
        return -1;
      }
      return 0; // a must be equal to b
    });
        
    buildLocationList(listings);
    addMarkers(listings);
  });

geocoder.on('result', function(ev) {
    var searchResult = ev.result.geometry;
    var options = { units: 'miles' };
    listings.features.forEach(function(listing) {
        Object.defineProperty(listing.properties, 'distance', {
        value: turf.distance(searchResult, listing.geometry, options),
        writable: true,
        enumerable: true,
        configurable: true
        });
    });
    listings.features.sort(function(a, b) {
      if (a.properties.distance > b.properties.distance) {
        return 1;
      }
      if (a.properties.distance < b.properties.distance) {
        return -1;
      }
      return 0; // a must be equal to b
    });
    var listings_list = document.getElementById('listings');
    while (listings_list.firstChild) {
      listings_list.removeChild(listings_list.firstChild);
    }
    buildLocationList(listings);
    //flyToStore(listings.features[0]);
    createPopUp(listings.features[0]);
 
});
      
  /**
   * Add a marker to the map for every store listing.
   **/
  function addMarkers(new_listings) {
    /* For each feature in the GeoJSON object above: */
    new_listings.features.forEach(function (marker) {
      /* Create a div element for the marker. */
      var el = document.createElement('div');
      /* Assign a unique `id` to the marker. */
      el.id = 'marker-' + marker.properties.id;
      /* Assign the `marker` class to each marker for styling. */
      el.className = 'marker';

      /**
       * Create a marker using the div element
       * defined above and add it to the map.
       **/
      new mapboxgl.Marker(el, { offset: [0, -23] })
        .setLngLat(marker.geometry.coordinates)
        .addTo(map);

      /**
       * Listen to the element and when it is clicked, do three things:
       * 1. Fly to the point
       * 2. Close all other popups and display popup for clicked store
       * 3. Highlight listing in sidebar (and remove highlight for all other listings)
       **/
      el.addEventListener('click', function (e) {
        /* Fly to the point */
        flyToStore(marker);
        /* Close all other popups and display popup for clicked store */
        createPopUp(marker);
        /* Highlight listing in sidebar */
        var activeItem = document.getElementsByClassName('active');
        var activeButton = document.getElementsByClassName('button');
        e.stopPropagation();
        if (activeItem[0]) {
          activeItem[0].style.textAlign = 'left';
          activeItem[0].classList.remove('active');
          activeButton[0].style.display = 'none';
          activeButton[0].classList.remove('button');
        }
        var listing = document.getElementById(
          'listing-' + marker.properties.id
        );
        listing.classList.add('active');
        listing.lastChild.classList.add('button');
        listing.lastChild.style.display = 'inline-block';
        listing.style.textAlign = 'center'; 
        listing.scrollIntoView({  behavior: 'smooth', block: 'center', inline: 'center' });
      });
    });
  }

  /**
   * Add a listing for each store to the sidebar.
   **/
  function buildLocationList(data) {
    data.features.forEach(function (store, i) {
      /**
       * Create a shortcut for `store.properties`,
       * which will be used several times below.
       **/
      var prop = store.properties;
      if (prop.space > 0){

        /* Add a new listing section to the sidebar. */
        var listings = document.getElementById('listings');
        var listing = listings.appendChild(document.createElement('div'));
        /* Assign a unique `id` to the listing. */
        listing.id = 'listing-' + prop.id;
        /* Assign the `item` class to each listing for styling. */
        listing.className = 'item';

        /* Add the link to the individual listing created above. */
        var link = listing.appendChild(document.createElement('a'));
        link.href = '#';
        link.className = 'title';
        link.id = 'link-' + prop.id;
        link.innerHTML = '<font size="4">' +  prop.address;

        /* Add details to the individual listing. */
        var details = listing.appendChild(document.createElement('div'));
          details.innerHTML = '<font size="3"><strong> Box/week: $' + prop.price.toFixed(2);
          details.innerHTML += '<br/>' +prop.name;
        details.innerHTML += ' &middot; City: ' + prop.city;
        if (prop.phone) {
          details.innerHTML += ' &middot; Phone: ' + prop.phone;
          details.innerHTML += '<br />Space: ' + prop.space + ' boxes';
          details.innerHTML += ' &middot; Duration: ' + prop.duration + ' weeks';
        }

        /* Add button for renting listing */
          var buttonElem = document.createElement('div');
          /* Assign a unique `id` to the button. */
          buttonElem.id = 'button';
          /* Assign the `marker` class to each button for styling. */
          buttonElem.href = '/listing/' + prop.listing_id;
          buttonElem.innerHTML = 'Request Space';
          buttonElem.className = 'button';
          buttonElem.style.display = 'none';

          buttonElem.onclick = function() { // remove list item here
              window.location = buttonElem.href;
          };
          listing.appendChild(buttonElem);
          buttonElem.classList.remove('button');

        /**
        * Listen to the element and when it is clicked, do four things:
        * 1. Update the `currentFeature` to the store associated with the clicked link
        * 2. Fly to the point
        * 3. Close all other popups and display popup for clicked store
        * 4. Highlight listing in sidebar (and remove highlight for all other listings)
        **/
      if (prop.distance) {
        var roundedDistance = Math.round(prop.distance * 10) / 10;
        details.innerHTML += '<br /><strong>' + roundedDistance + ' miles away</strong>';
      }
        link.addEventListener('click', function (e) {
          for (var i = 0; i < data.features.length; i++) {
            if (this.id === 'link-' + data.features[i].properties.id) {
              var clickedListing = data.features[i];
              var num = i;
              flyToStore(clickedListing);
              createPopUp(clickedListing);
            }
          }
          // add delete button
          var activeItem = document.getElementsByClassName('active');
          var activeButton = document.getElementsByClassName('button');
          if (activeItem[0]) {
            activeItem[0].style.textAlign = 'left';
            activeItem[0].classList.remove('active');
            activeButton[0].style.display = 'none'; 
            activeButton[0].classList.remove('button');
          }
          this.parentNode.classList.add('active');
          this.parentNode.lastChild.classList.add('button');
          this.parentNode.lastChild.style.display = 'inline-block';
          this.parentNode.style.textAlign = 'center'; 
        });
      }
    });
  }

  /**
   * Use Mapbox GL JS's `flyTo` to move the camera smoothly
   * a given center point.
   **/
  function flyToStore(currentFeature) {
    map.flyTo({
      center: currentFeature.geometry.coordinates,
      zoom: 14
    });
  }

  /**
   * Create a Mapbox GL JS `Popup`.
   **/
  function createPopUp(currentFeature) {
    var popUps = document.getElementsByClassName('mapboxgl-popup');
    if (popUps[0]) popUps[0].remove();
    var popup = new mapboxgl.Popup({ closeOnClick: false })
      .setLngLat(currentFeature.geometry.coordinates)
      .setHTML(
        '<h3>Airstorage</h3>' +
          '<h4>' +
          currentFeature.properties.address +
          '</h4>'
      )
      .addTo(map);
  }

  const filterResults = document.getElementById("filterResults");
  const filtersPopUp = document.getElementById("filtersPopUp");
  filterResults.addEventListener("click", () => {
    filtersPopUp.classList.remove("hide-visually");
    filtersPopUp.classList.add("z5");
  });

  exitButton.addEventListener("click", () => {
    filtersPopUp.classList.add("hide-visually");
  });

  function filter(dur, space, price, distance, listing) {
    return (dur > listing.duration || space > listing.space
        || price > listing.price || distance > listing.distance )
  }

  function filterAll() {
    var listings_list = document.getElementById('listings');
    while (listings_list.firstChild) {
      listings_list.removeChild(listings_list.firstChild);
    }
        
    buildLocationList(listings);
    listings_list = document.getElementById('listings');
    var i = 0;
    for(var child=listings_list.firstChild; child!==null; child=child.nextSibling) {
        var marker_child = document.getElementById('marker-' + listings.features[i].properties.id);
        marker_child.style.visibility = "visible";
        var filter_bool = filter($("#duration-filter").val(), $("#box-filter").val(),
        $("#price-filter").val(), $("#distance-filter").val(), listings.features[i].properties);
        if (filter_bool){
          listings_list.removeChild(child);
          marker_child.style.visibility = "hidden";
        }
        i = i+ 1;
    }
  }

  resetFilters.addEventListener("click", () => {
    $("#duration-filter").val(0)
    $("#box-filter").val(0)
    $("#price-filter").val(0)
    $("#listings").empty();
    //buildLocationList(listings)
    var listings_list = document.getElementById('listings');
    while (listings_list.firstChild) {
      listings_list.removeChild(listings_list.firstChild);
    }
        
    buildLocationList(listings);
    listings_list = document.getElementById('listings');
    var marker_child = document.getElementById('marker-' + listings.features[0].properties.id);
    var i = 0;
    for(var child=listings_list.firstChild; child!==null; child=child.nextSibling) {
        marker_child.style.visibility = "visible";
        i = i+ 1;
      marker_child = document.getElementById('marker-' + listings.features[i].properties.id);
    }
  });
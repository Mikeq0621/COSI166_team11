mapboxgl.accessToken = 'pk.eyJ1IjoiZmVkZTEwIiwiYSI6ImNrbXFuYzIxNTBzYmQydXQ3aTUwdjd6aXgifQ.RNf0HA32s1e-bquFTaP5Lg';
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
    });
var marker = new mapboxgl.Marker({color: "red"})
.setLngLat([30.5, 50.5])
.addTo(map);
{/* <script> */}
 // Note: This example requires that you consent to location sharing when
 // prompted by your browser. If you see the error "The Geolocation service
 // failed  .", it means you probably did not give permission for the browser to
 // locate you.

 var latitude = 27.7172453; // YOUR LATITUDE VALUE
var longitude = 85.3239605; // YOUR LONGITUDE VALUE
            
 var myLatlng = {lat: -34.397, lng: 150.644};
 var map, infoWindow;
 function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 17
  });
  infoWindow = new google.maps.InfoWindow;

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      infoWindow.open(map);
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }

    // Update lat/long value of div when anywhere in the map is clicked    
    google.maps.event.addListener(map,'click',function(event) {                
      // document.getElementById('latclicked').innerHTML = event.latLng.lat();
      // document.getElementById('longclicked').innerHTML =  event.latLng.lng();
      console.log("LAT LOG", event.latLng.lat().toString());
      //Isso captura a latitude e longitude no click
      //TODO: Fazer busca no google maps para encontrar rua pela lat e long. Enviar essa rua para a função saerch_for_bus_stop 
  });
  

  //Talvez não precise de nada daqui pra baixo
          
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    //title: 'Hello World'
    
    // setting latitude & longitude as title of the marker
    // title is shown when you hover over the marker
              title: latitude + ', ' + longitude 
            });    
            
            // Update lat/long value of div when the marker is clicked
            marker.addListener('click', function(event) {              
              document.getElementById('latclicked').innerHTML = event.latLng.lat();
              document.getElementById('longclicked').innerHTML =  event.latLng.lng();
            });
            
            // Create new marker on double click event on the map
            google.maps.event.addListener(map,'dblclick',function(event) {
                var marker = new google.maps.Marker({
                  position: event.latLng, 
                  map: map, 
                  title: event.latLng.lat()+', '+event.latLng.lng()
                });
                
                // Update lat/long value of div when the marker is clicked
                marker.addListener('click', function() {
                  document.getElementById('latclicked').innerHTML = event.latLng.lat();
                  document.getElementById('longclicked').innerHTML =  event.latLng.lng();
                });            
            });



  }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
    infoWindow.open(map);
  };

  // </script>



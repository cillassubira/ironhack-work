var map;

if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function onLocation(position){
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  createMap(myPosition);
  setupAutocomplete();
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(position){
  var mapOptions = {
    center: position,
    zoom: 17
  };
  map = new google.maps.Map($('#map')[0], mapOptions);
}

function createMarker(position){
  var marker = new google.maps.Marker({
    position: position,
    map: map
  });
}

function setupAutocomplete(){
  var input = $('#get-places')[0]
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if(place.geometry.location){
      map.setCenter(place.geometry.location);
      map.setZoom(17);
      storePositionsOnLocal(place.geometry.location)
      createMarker(place.geometry.location);
    } else {
      alert("The place has no location...?")
    }
  });
}

function storePositionsOnLocal(position) {
      var presentPosition = {
        position: position
      }
      if (window.localStorage.length == 0){
        window.localStorage.setItem('positions',JSON.stringify(presentPosition));
      } else {
        var visitedPlaces = $.makeArray(JSON.parse(window.localStorage.getItem('positions')));
        visitedPlaces.push(presentPosition);
        window.localStorage.setItem('positions', JSON.stringify(visitedPlaces));
      }
}

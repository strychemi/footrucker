var longitude, latitude;

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.setCoords(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function setCoords(position) {
  latitude = position.coords.latitude;
  longitude = position.coords.longitude;
}

$(window).load(function() {
  getLocation();

  url = 'http://data.ct.gov/resource/9k2y-kqxn.json?organization_type=Public%20School%20Districts&$$app_token=CGxaHQoQlgQSev4zyUh5aR5J3';

  // Intialize our map
  var center = new google.maps.LatLng(41.7656874,-72.680087);
  var mapOptions = {
    zoom: 8,
    center: center
  };
  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

  // Retrieve our data and plot it
  $.getJSON(url, function(data, textstatus) {
      console.log(data);
      $.each(data, function(i, entry) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(entry.location_1.latitude,
            entry.location_1.longitude),
          map: map,
          title: location.name
        });
      });
  });
});

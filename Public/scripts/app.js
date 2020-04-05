var localBra = {};
async function postDB() {
    let user = {
        altitude: 43,
        username: 'Smith',
        positionID: 1
    };
  
      let response =  await fetch('https://droneservice.herokuapp.com/users/', {
        method: 'POST',
        headers: {
        'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(user)
     });
  
      let result =  await response.json();
    alert(result.username);
}
//
async function getDB() {
    let url = 'https://droneservice.herokuapp.com/users/';
    let response = await fetch(url);
    let commits = await response.json(); // читаем ответ в формате JSON
    alert(commits[0].username);
}
//
async function getLocation() {
    let url = 'https://droneservice.herokuapp.com/tracking/';
    let response = await fetch(url);
    let locationBrazil = await response.json(); // читаем ответ в формате JSON
    //let last_i = locationBrazil.length;
    //let posLoc = locationBrazil[last_i - 1]
    //console.log(locationBrazil[last_i - 1]);
    localBra = {lat:locationBrazil.lat, lng:locationBrazil.lon}
    console.log(localBra);
}
function geoFindMe() {

    const status = document.querySelector('#status');
    const mapLink = document.querySelector('#map-link');
  
    mapLink.href = '';
    mapLink.textContent = '';
  
    function success(position) {
      const latitude  = position.coords.latitude;
      const longitude = position.coords.longitude;
  
      status.textContent = '';
      mapLink.href = `https://www.openstreetmap.org/#map=18/${latitude}/${longitude}`;
      mapLink.textContent = `Latitude: ${latitude} °, Longitude: ${longitude} °`;
    }
  
    function error() {
      status.textContent = 'Unable to retrieve your location';
    }
  
    if (!navigator.geolocation) {
      status.textContent = 'Geolocation is not supported by your browser';
    } else {
      status.textContent = 'Locating…';
      navigator.geolocation.getCurrentPosition(success, error);
    }
  
  }
  
  document.querySelector('#find-me').addEventListener('click', geoFindMe);
//

  //
  function onTap(evt) {
    // calculate infobubble position from the cursor screen coordinates
    let position = map.screenToGeo(
      evt.currentPointer.viewportX,
      evt.currentPointer.viewportY
    );
    
 
    // read the properties associated with the map feature that triggered the event
    let props = evt.target.getData().properties;
    drawCircle(position);
  }
  function drawCircle(position) {
    addCircleToMap(position);
}
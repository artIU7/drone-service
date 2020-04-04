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
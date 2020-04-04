alert("Hello, alert!");

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
function addCircleToMap(coord){
    map.addObject(new H.map.Circle(
      // The central point of the circle
      coord,
      // The radius of the circle in meters
      1000,
      {
        style: {
          strokeColor: 'rgba(55, 85, 170, 0.6)', // Color of the perimeter
          lineWidth: 2,
          fillColor: 'rgba(0, 128, 0, 0.7)'  // Color of the circle
        }
      }
    ));
  }
  //
  function onTap(evt) {
    // calculate infobubble position from the cursor screen coordinates
    let position = map.screenToGeo(
      evt.currentPointer.viewportX,
      evt.currentPointer.viewportY
    );
    addCircleToMap(position)
 
    // read the properties associated with the map feature that triggered the event
    let props = evt.target.getData().properties;
  }
  function drawCircle() {
    let url = 'https://droneservice.herokuapp.com/users/';
    let response = await fetch(url);
    let commits = await response.json(); // читаем ответ в формате JSON
    alert(commits[0].username);
}
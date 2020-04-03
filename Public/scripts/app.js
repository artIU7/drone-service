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
    alert(result.message);
}
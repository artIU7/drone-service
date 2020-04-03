alert("Hello, alert!");


let user = {
    altitude: 43,
    username: 'Smith',
    positionID: 1
  };
  
  let response =  fetch('https://droneservice.herokuapp.com/users/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8'
    },
    body: JSON.stringify(user)
  });
  
  let result =  response.json();
  alert(result.message);
  console.log(JSON.parse(JSON.stringify(user)));

import Rails from "@rails/ujs"

const sendLocation = () => {

  const loc = document.getElementById("geoLoc");

  const showPosition = (position) => {
    console.log('show position is being called')
    const locations = {lat:position.coords.latitude, long:position.coords.longitude};
    let data = new FormData();
    data.append('lat', position.coords.latitude);
    data.append('long', position.coords.longitude);
     Rails.ajax({
      url: '/maps',
      type: "POST",
      data: data
    })
  }

  const getLocation = () => {
    console.log('get location is being called');
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      loc.innerHTML = "Geolocation is not supported by this browser.";
    }
  }

  loc.addEventListener('click', (event) => {
    getLocation();
  });

}

export { sendLocation };

// add event listener
// ajax

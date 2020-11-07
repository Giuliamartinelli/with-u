var timeleft = 3;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
    document.getElementById("countdown").innerHTML = "Starting Fakecall";
  } else {
    document.getElementById("countdown").innerHTML = "-0:0" + timeleft;
  }
  timeleft -= 1;
}, 1000);

// var minutesLabel = document.getElementById("minutes");
// var secondsLabel = document.getElementById("seconds");
// var totalSeconds = 0;
// setInterval(setTime, 1000);

// function setTime() {
//   ++totalSeconds;
//   secondsLabel.innerHTML = pad(totalSeconds % 60);
//   minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
// }


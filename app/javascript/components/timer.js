var timeleft = 3;
var downloadTimer = setInterval(function(){
  if(timeleft <= 0){
    clearInterval(downloadTimer);
    document.getElementById("countdown").innerHTML = "Starting Fakecall";
  } else {
    document.getElementById("countdown").innerHTML = "0:0" + timeleft;
  }
  timeleft -= 1;
}, 1000);

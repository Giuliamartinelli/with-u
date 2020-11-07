var timeleft = -3;
const downloadTimer = () => setInterval(function(){
  if (timeleft < 0) {
    document.getElementById("countdown").innerHTML = "-0:0" + (-timeleft);
  }

  else if(timeleft == 0){
    document.getElementById("countdown").innerHTML = "Starting Fakecall";
  }

  else if(timeleft > 9 && timeleft < 21){
    document.getElementById("countdown").innerHTML = "0:" + timeleft;
  }

  else if(timeleft >= 21){
    clearInterval(downloadTimer);
  } else{
    document.getElementById("countdown").innerHTML = "0:0" + timeleft;
  }
  timeleft += 1;
}, 1000);

export { downloadTimer };



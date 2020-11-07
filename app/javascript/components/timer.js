var timeleft = -3;
const timer = () => document.querySelector('#countdown');

const downloadTimer = () => setInterval(function(){
  if (timer()) {
    if (timeleft < 0) {
      timer().innerHTML = "-0:0" + (-timeleft);
    } else if(timeleft == 0){
     timer().innerHTML = "Starting Fakecall";
    } else if(timeleft > 9 && timeleft < 21){
      timer().innerHTML = "0:" + timeleft;
    } else if(timeleft >= 21){
      clearInterval(downloadTimer);
    } else{
      timer().innerHTML = "0:0" + timeleft;
    }
    timeleft += 1;
  }
}, 1000);

export { downloadTimer };

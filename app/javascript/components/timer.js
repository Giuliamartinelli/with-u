var timeleft = 3;

const timer = () => document.querySelector('#countdown');

const downloadTimer = () => setInterval(function(){

  if (timer()) {
    if(timeleft <= 0){
        clearInterval(downloadTimer);
        timer().innerHTML = "Starting Fakecall";
    } else {
      timer().innerHTML = "-0:0" + timeleft;
    }
  }
  timeleft -= 1;
}, 1000);


export { downloadTimer };

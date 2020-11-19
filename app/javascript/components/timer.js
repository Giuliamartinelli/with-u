var PauseTimer = false;

// const for pause
const pauseButton = () => document.getElementById('pause-audio-change');
const greenPauseButton = () => pauseButton().querySelector('.bg-green');

const setTimerPause = () => {
  if (pauseButton()) {
    pauseButton().addEventListener("click", (event) => {
      if (greenPauseButton()) {
        PauseTimer = false
        console.log("run timer");
      }
      else {
        PauseTimer = true
        console.log("stop timer");
      }
    })
  }
}

const counting = ()  => {

  var timeleft = -3;
  const timer = document.querySelector('#countdown');

  const downloadTimer = () => setInterval(function(){

    if (timer && PauseTimer == false) {
      if (timeleft <= 0) {
        timer.innerHTML = "-0:0" + (-timeleft);
      } else if(timeleft > 9 && timeleft < 21){
        timer.innerHTML = "0:" + timeleft;
      } else if(timeleft >= 21){
        clearInterval(downloadTimer);
      } else{
        timer.innerHTML = "0:0" + timeleft;
      }

      timeleft += 1
    };
  }, 1000);

  downloadTimer()
}

export { counting, setTimerPause };

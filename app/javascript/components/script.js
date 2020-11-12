var SecondCall = false;

const playButton = () => document.querySelector('.audio-play');
const greenButton = () => document.querySelector('.btn-second-call-green');

const setSecondCall = () => {
  if (playButton()) {
    playButton().addEventListener("click", (event) => {
      if (greenButton()) {
        SecondCall = true;
      }
      else {
        SecondCall = false;
      }
    })
  }
}

const script = ()  => {

  var timeleft = -3;

  const script = document.querySelector('#script-scroll');

  const downloadScript = () => setInterval(function(){

    if (script) {
      if (SecondCall) {
        if (timeleft <= 0) { //second call
          script.innerHTML = "second call";
        } else if(timeleft > 0 && timeleft < 4){
          script.innerHTML = "<em>You:</em>   I'm a second call <br> ";
        } else if(timeleft > 5 && timeleft < 10){
          script.innerHTML = "<em>You:</em>   I'm a second call.<br>   Did you get it?";
        } else if(timeleft > 11 && timeleft < 15){
          script.innerHTML = "<em>You:</em>   I'm a second call.<br>  I'll be there soon!";
        } else if(timeleft > 16 && timeleft < 21){
          script.innerHTML = "<em>You:</em>   I'm a second call!<br> ";
        } else if(timeleft >= 21){
          clearInterval(downloadScript);
        }
      } else {
        if (timeleft <= 0) { //first call
          script.innerHTML = "Follow the script to <br>answer the recorded call";
        } else if(timeleft > 0 && timeleft < 4){
          script.innerHTML = "<em>You:</em>   I'm on my way! <br> ";
        } else if(timeleft > 5 && timeleft < 10){
          script.innerHTML = "<em>You:</em>   Ok, I just sent it.<br>   Did you get it?";
        } else if(timeleft > 11 && timeleft < 15){
          script.innerHTML = "<em>You:</em>   Ok, perfect.<br>  I'll be there soon!";
        } else if(timeleft > 16 && timeleft < 21){
          script.innerHTML = "<em>You:</em>   Bye!<br> ";
        } else if(timeleft >= 21){
          clearInterval(downloadScript);
        }
      }

      timeleft += 1
    };
  }, 1000);
  downloadScript()
}

export { script, setSecondCall };

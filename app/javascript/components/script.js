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

const greenPauseButton = () => document.querySelector('.bg-green-pause');

const script = ()  => {

  var timeleft = -3;

  const script = document.querySelector('#script-scroll');

  const downloadScript = () => setInterval(function(){

    if (script && !greenPauseButton() ) {
      if (SecondCall) {
        if (timeleft <= 0) { //second call
          script.innerHTML = "Segui il testo per <br>rispondere alla chiamata";
        } else if(timeleft > 0 && timeleft < 5){
          script.innerHTML = "<em>Tu:</em>   Ciao, si tutto bene. <br> Ci sono quasi, dammi altri 5 minuti";
        } else if(timeleft > 6 && timeleft < 10){
          script.innerHTML = "<em>Tu:</em>   Si faccio in fretta, corro! <br> ";
        } else if(timeleft > 12 && timeleft < 16){
          script.innerHTML = "<em>Tu:</em>   Va bene, te la mando di nuovo <br> ";
        } else if(timeleft > 17 && timeleft < 21){
          script.innerHTML = "<em>Tu:</em>   A tra poco, ciao! <br> ";
        } else if(timeleft >= 21){
          clearInterval(downloadScript);
        }
      } else {
        if (timeleft <= 0) { //first call
          script.innerHTML = "Segui il testo per <br>rispondere alla chiamata";
        } else if(timeleft > 0 && timeleft < 4){
          script.innerHTML = "<em>Tu:</em>   Si si, sto arrivando! <br> ";
        } else if(timeleft > 5 && timeleft < 10){
          script.innerHTML = "<em>Tu:</em>   Ok, la ho appena mandata.<br> La hai ricevuta?";
        } else if(timeleft > 11 && timeleft < 15){
          script.innerHTML = "<em>Tu:</em>   Perfetto.<br> 5 minuti e ci sono!";
        } else if(timeleft > 16 && timeleft < 21){
          script.innerHTML = "<em>Tu:</em>   Ciao!<br> ";
        } else if(timeleft >= 21){
          clearInterval(downloadScript);
        }
      }
      timeleft += 1
    };
  }, 1000);
  downloadScript()
}

export { script, setSecondCall, };

const script = ()  => {

  var timeleft = -3;

  //will be where we write the text
  const script = document.querySelector('#script-scroll');

  //sets the interval
  const downloadScript = () => setInterval(function(){

    if (script) { //if the queryselector exists

      if (timeleft <= 0) {
        script.innerHTML = "Follow the script to <br>answer the recorded call"; //written inside the html
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

      timeleft += 1 //increment the time
    };
  }, 1000); //milliseconds

  downloadScript() // call the function
}

export { script };

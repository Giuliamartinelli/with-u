const script = ()  => {

  var timeleft = -3;

  //will be where we write the text
  const timer = document.querySelector('#countdown');

  //sets the interval
  const downloadTimer = () => setInterval(function(){

    if (timer) { //if the queryselector exists

      if (timeleft <= 0) {
        timer.innerHTML = "-0:0" + (-timeleft); //written inside the html
      } else if(timeleft > 9 && timeleft < 21){
        timer.innerHTML = "0:" + timeleft;
      } else if(timeleft >= 21){
        clearInterval(downloadTimer);
      } else{
        timer.innerHTML = "0:0" + timeleft;
      }

      timeleft += 1 //increment the time
    };
  }, 1000); //milliseconds

  downloadTimer() // call the function
}

export { counting };

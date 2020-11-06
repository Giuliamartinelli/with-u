const playButton = () => document.querySelectorAll('.audio-play');
const pauseButton = () => document.querySelectorAll('.audio-pause');

const audioPlay = (audio) => {
  if (playButton()) {
    playButton().forEach((btn) => {
      btn.addEventListener("click", (event) => {
       audio.play();
      })
    })
  }
};

const audioPause = (audio) => {
  if (pauseButton()) {
    pauseButton().forEach((btn) => {
      btn.addEventListener("click", (event) => {
       audio.pause();
      })
    })
  }
};


export { audioPlay, audioPause };

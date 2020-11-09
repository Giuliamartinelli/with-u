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

const playButtonCall = () => document.querySelectorAll('.audio-play-call');
const pauseButtonCall = () => document.querySelectorAll('.audio-pause-call');

const audioPlayCall = (audio) => {
  if (playButtonCall()) {
    playButtonCall().forEach((btn) => {
      btn.addEventListener("click", (event) => {
       audio.play();
      })
    })
  }
};

const audioPauseCall = (audio) => {
  if (pauseButtonCall()) {
    pauseButtonCall().forEach((btn) => {
      btn.addEventListener("click", (event) => {
       audio.pause();
      })
    })
  }
};

const restartButtonCall = () => document.querySelector('.audio-restart-call');

const audioRestartCall = (audio) => {
  if (restartButtonCall()) {
    restartButtonCall().addEventListener("click", (event) => {
        audio.currentTime = 0;
      })
  }
};

export { audioPlay, audioPause, audioPlayCall, audioPauseCall, audioRestartCall };


const playButton = () => document.querySelectorAll('.audio-play');
const pauseButton = () => document.querySelectorAll('.audio-pause');
const secondCall = () => document.querySelector('.btn-second-call-green');

const audioPlay = (audio) => {
  if (playButton()) {
    playButton().forEach((btn) => {
      btn.addEventListener("click", (event) => {
        if (secondCall()) {
          console.log('2');
          audio[1].play();
        } else {
          console.log('1');
          audio[0].play();
        }
      })
    })
  }
};

const audioPause = (audio) => {
  if (pauseButton()) {
    pauseButton().forEach((btn) => {
      btn.addEventListener("click", (event) => {
        audio.forEach((track) => {
          track.pause();
        })
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
        audio.forEach((track) => {
          track.play();
        })
      })
    })
  }
};

const audioPauseCall = (audio) => {
  if (pauseButtonCall()) {
    pauseButtonCall().forEach((btn) => {
      btn.addEventListener("click", (event) => {
        audio.forEach((track) => {
          track.pause();
        })
      })
    })
  }
};

const restartButtonCall = () => document.querySelector('.audio-restart-call');

const audioRestartCall = (audio) => {
  if (restartButtonCall()) {
    restartButtonCall().addEventListener("click", (event) => {
      audio.forEach((track) => {
        track.currentTime = 0;
      })
    })
  }
};

export { audioPlay, audioPause, audioPlayCall, audioPauseCall, audioRestartCall };


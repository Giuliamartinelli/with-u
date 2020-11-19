
//incoming.html.erb -- send location div
const btnChangeFind = () => document.getElementById('first-loc-btn');

const changeColorLoc = () => {
  if (btnChangeFind()) {
    btnChangeFind().addEventListener("click", (event) => {
      const findBtn = document.querySelector('#btnchangegreen');
      const findWrt = document.querySelector('#wrtchangegreen');
      findBtn.classList.remove("btn-loc-small-white");
      findBtn.classList.add("btn-loc-small-green");
      findWrt.classList.remove("call-description-white");
      findWrt.classList.add("call-description-green");
    })
  }
};

//incoming.html.erb -- second call div
const btnSecondFind = () => document.getElementById('second-fake-call');

const changeColorSecond = () => {
if (btnSecondFind()) {
    btnSecondFind().addEventListener("click", (event) => {
      const findBtn = document.querySelector('#btnchangegreensecond');
      const findWrt = document.querySelector('#wrtchangegreensecond');
      findBtn.classList.remove("btn-second-call-white");
      findBtn.classList.add("btn-second-call-green");
      findWrt.classList.remove("call-description-white");
      findWrt.classList.add("call-description-green");
      })
    }
  };

// fakecall.html.erb -- call angels

const btnCallFind = () => document.getElementById('call-angels-change');

const changeColorCall = () => {
  if (btnCallFind()) {
    btnCallFind().addEventListener("click", (event) => {
      const findBtn = document.querySelector('#btnchangegreencall');
      const findWrt = document.querySelector('#wrtchangegreencall');
      findBtn.classList.remove("bg-gray");
      findBtn.classList.add("bg-green");
      findWrt.classList.remove("call-description-white");
      findWrt.classList.add("call-description-green");
      })
    }
  };

// fakecall.html.erb -- send location

const btnSendLocFind = () => document.getElementById('send-location-change');

const changeColorSendLoc = () => {
  if (btnSendLocFind()) {
    btnSendLocFind().addEventListener("click", (event) => {
      const findBtn = document.querySelector('#btnchangegreensendloc');
      const findWrt = document.querySelector('#wrtchangegreensendloc');
      findBtn.classList.remove("bg-gray");
      findBtn.classList.add("bg-green");
      findWrt.classList.remove("call-description-white");
      findWrt.classList.add("call-description-green");
      })
    }
  };

// fakecall.html.erb -- pause audio

const btnAudioFind = () => document.getElementById('pause-audio-change');

const changeColorAudio = () => {
  if (btnAudioFind()) {
    btnAudioFind().addEventListener("click", (event) => {
      const findBtn = document.querySelector('#btnchangegreenaudio');
      const findWrt = document.querySelector('#wrtchangegreenaudio');

      findBtn.classList.remove("bg-gray");
      findBtn.classList.add("bg-green");
      findWrt.classList.remove("call-description-white");
      findWrt.classList.add("call-description-green");

      })
    }
  };



export { changeColorLoc, changeColorSecond, changeColorCall, changeColorSendLoc, changeColorAudio };




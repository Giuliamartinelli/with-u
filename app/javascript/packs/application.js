// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// import Rails from "@rails/ujs"
// Rails.start()
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { sendLocation } from "../components/send_location.js";
import { audioPlay, audioPause, audioPlayCall, audioPauseCall } from "../components/audio_commands.js";
import { initMapbox } from '../plugins/init_mapbox';
import { counting } from "../components/timer.js";


const audio_call = new Audio("https://res.cloudinary.com/dmocwgygk/video/upload/v1604762876/marco-recording.m4a")
const incoming_call = new Audio("https://res.cloudinary.com/dmocwgygk/video/upload/v1604758819/classic_orginal_tone.mp3")


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  sendLocation();
  audioPlay(audio_call);
  audioPause(audio_call);
  counting();
  audioPlayCall(incoming_call);
  audioPauseCall(incoming_call);
});

window.addEventListener('load', () => {
  navigator.serviceWorker.register('/service-worker.js').then(registration => {
    console.log('ServiceWorker registered: ', registration);

    var serviceWorker;
    if (registration.installing) {
      serviceWorker = registration.installing;
      console.log('Service worker installing.');
    } else if (registration.waiting) {
      serviceWorker = registration.waiting;
      console.log('Service worker installed & waiting.');
    } else if (registration.active) {
      serviceWorker = registration.active;
      console.log('Service worker active.');
    }
  }).catch(registrationError => {
    console.log('Service worker registration failed: ', registrationError);
  });
});




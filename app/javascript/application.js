
	
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
// import { Turbo } from "@hotwired/turbo-rails"
// Turbo.session.drive = false

import "controllers"

import * as bootstrap from "bootstrap"





document.addEventListener("turbo:load", () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)


  })
})



//= require jquery3
//= require popper
//= require bootstrap-sprockets

    

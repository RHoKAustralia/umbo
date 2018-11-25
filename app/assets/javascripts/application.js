// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var ready = function() {
  // buttons = document.querySelector('');
  // buttons.forEach( function() {
  //   if 
  // });
  // window.onload = () => {
  //   let lbl = document.querySelector('label');
  //   console.log(lbl.for)
  //   let cbx = document.querySelectorAll('input[type=checkbox]');
  //   lbl.forEach((checkbox) => {
  //     console.log(checkbox.for)
  //   })
  // }
  $(".btn-blue-toggle").on("click", function(event) {
    console.log($(this).hasClass('btn-outline-primary'));
    if ($(this).hasClass('btn-outline-primary')) {
      $(this).removeClass('btn-outline-primary');
      $(this).addClass('btn-primary');
    } else {
      $(this).removeClass('btn-primary');
      $(this).addClass('btn-outline-primary');
    }
  });
}

// $(function() {
//   ready();
// });

$(document).on('turbolinks:load', ready);
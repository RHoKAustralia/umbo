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
  $(".btn-blue-toggle").on("click", function(event) {
    $(this).toggleClass('btn-outline-primary');
    $(this).toggleClass('btn-primary');
  });
}

$(document).on('turbolinks:load', ready);

// $(document).on('turbolinks:load', () => {
//     const updateButton = label => {
//         const $label = $(label);

//         const checkbox = $(`#${$label.attr("for")}`);
//         const isChecked = checkbox.is(":checked");

//         if (isChecked) {
//             $label.removeClass("btn-primary");
//             $label.addClass("btn-outline-primary");
//         } else {
//             $label.removeClass("btn-outline-primary");
//             $label.addClass("btn-primary");
//         }
//     };

//     $(".btn-blue-toggle").on("click", function(event) {
//         updateButton(this);
//     });
// });
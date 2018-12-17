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

var toggleCheckboxLabelClass = function(){
  if ($(this).is(":checked")) {
    $("label[for='"+$(this).attr("id")+"']").removeClass("btn-outline-primary")
    $("label[for='"+$(this).attr("id")+"']").addClass("btn-primary")
  } else {
    $("label[for='"+$(this).attr("id")+"']").removeClass("btn-primary")
    $("label[for='"+$(this).attr("id")+"']").addClass("btn-outline-primary")
  }
};

var readURL = function(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('.profile-pic').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

var ready = function() {
  // Add and remove styles on specialty checkboxes
  $('.specialty-checkboxes input:checkbox').each(toggleCheckboxLabelClass);
  $('.specialty-checkboxes input:checkbox').change(toggleCheckboxLabelClass);

  // Used for profile image loading
  $(".file-upload").on('change', function(){
    readURL(this);
  });

  // Used for activating file input when label is clicked
  $(".upload-button, #plus-icon").on('click', function() {
     $(".file-upload").click();
  });
};

$(document).on('turbolinks:load', ready);
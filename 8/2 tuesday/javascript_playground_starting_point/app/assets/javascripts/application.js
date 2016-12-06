// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


console.log("Hello World");

$(".list-element").hide();

$("#show_true").on("click", function showStuff() {
  $("#show_hide_section").show();
});

$("#show_false").on("click", function hideStuff() {
  $("#show_hide_section").hide();
});

$("#copy_link").on("click", function copyStuff() {
  var moreText = $(".copyable").first().clone();
  $("#copy_section").append(moreText);
});

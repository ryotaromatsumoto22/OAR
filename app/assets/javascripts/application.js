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
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


//= require chartkick
//= require Chart.bundle


$(function() {
    $('.top-image').fadeIn(2000);
});

$(function() {
    $('.top-message').fadeIn(4000);
});

$('.marathon1').append(
	'<style>marathon1{display:none;}'
	);
	$(window).on("load", function() {
	$('.marathon1').delay(500).fadeIn("slow");
});


$(function() {
    $('.marathon2').fadeIn(1000);
});

$(function() {
    $('.marathon3').fadeIn(2000);
});

$(function() {
    $('.footer').fadeIn(4000);
});

$(function() {
    $('.sign-in').fadeIn(2000);
});

$(function() {
    $('.sign-up').fadeIn(2000);
});

$(function() {
    $('.project_index_container').fadeIn(2000);
});

$(function() {
    $('.project_show_container').slideToggle(2000);
});

$(function() {
    $('.project_new_container').fadeIn(2000);
});

$(function() {
    $('.project_edit_container').fadeIn(2000);
});

$(function() {
    $('.project_datum_new_container').fadeIn(2000);
});

$(function() {
    $('.user_index').fadeIn(2000);
});

$(function() {
    $('.follow_index').fadeIn(2000);
});

$(function() {
    $('.follower_index').fadeIn(2000);
});

$(function(){
    $('.graph').slideToggle(2000);
});


$(function(){
    $('.profile').slideToggle(2000);
});





// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

  $('a#signup').click(function(){
    $('.registration').slideToggle('slow');
    $('.login').hide();
  });

  $('a#login').click(function(){
    $('.login').slideToggle('slow');
    $('.registration').hide();
  });

});

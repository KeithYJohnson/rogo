// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {


  $('a#signup').click(function(){
    $('.registration').toggle( "slide" );
    $('.login').hide('slow');
  });

  $('a#login').click(function(){
    $('.login').toggle('slide');
    $('.registration').hide('slow');
  });

});

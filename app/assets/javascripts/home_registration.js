// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {


  $('a#signup').click(function(){
    $('.registration').fadeIn( "slide" );
    // $('.page-titles').append('<p>hi</hi>');
    $('.login').hide('slow');
  });

  $('a#login').click(function(){
    $('.login').fadeIn('slide');
    $('.registration').hide('slow');
  });

});

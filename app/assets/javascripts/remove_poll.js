$(document).ready(function(event){
  $('.delete-poll').click(function(){
    console.log(this)
    $(this).closest('.polls-data').hide('slow')
  }) 
});

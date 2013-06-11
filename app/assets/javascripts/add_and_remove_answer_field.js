$(document).ready(function(event) {
  $('.remove-answer-field').click(function(){
    // _destroy may require a boolean value instead of 0 or 1
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.answer-fields').hide('slow')

  })
  $('.add-answer-field').click(function(){
    console.log('hi');
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'),'g')
    $(this).before($(this).data('fields').replace(regexp,time))
  })
});
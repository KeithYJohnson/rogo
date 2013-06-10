$(document).ready(function() {
  $('.remove-answer-field').click(function(){
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.answer-fields').hide()
  })
});
// setInterval will do block recurringly
// setTimeout does it once
function pollServer(){
  setInterval(function(){
    ajax(
      // Div class dynamically set to poll.id
      var $id = $('div#ajaxurl').attr('class'_)
      url: '/polls/' + $id,


    )
  }, 4000);
};
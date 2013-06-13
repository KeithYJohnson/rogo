// setInterval will do block recurringly
// setTimeout does it once

function pollServer(){

    setInterval(function(){
      var id = $('div#ajaxurl').attr('class');
      $.ajax({
        // Div class dynamically set to poll.id
        
        type: 'GET',
        dataType: 'json',
        url: '/polls/' + id, 
        success: function(data){
          updateSurvey(data);
        },


      });
    }, 4000);
  };

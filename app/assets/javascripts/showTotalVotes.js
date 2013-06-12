function showTotalVotes(data_votes){
  var total_votes = 0;
  for (var i in data_votes) {
    total_votes += data_votes[i];
  }
  total_votes.toString();
  $('.total-votes').html('<h3>'+total_votes+'</h3>');

}
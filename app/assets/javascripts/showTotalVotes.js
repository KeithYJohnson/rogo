function showTotalVotes(data_votes){
  var total_votes = 0;
  for (var i in data_votes) {
    total_votes += data_votes[i];
  }
  $('.total-votes').empty();
  $('.total-votes').html('<h1>Total Votes</h1></br><h3 id="vote-count">'+total_votes+'</h3>');
}
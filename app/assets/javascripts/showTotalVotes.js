function showTotalVotes(data_votes){
  console.log('showTotalVotes');
  var total_votes = 0;
  for (var i in data_votes) {
    total_votes += data_votes[i];
    console.log(total_votes);
  }
  total_votes.toString();
  $('.total-votes').html('<h3>'+total_votes+'</h3>');

}
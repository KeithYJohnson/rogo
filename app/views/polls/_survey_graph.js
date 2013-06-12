function drawSurvey(data_votes){
  showTotalVotes(data_votes);
  var w = 500;
  var h = 420;
  // var height = data_votes.length < 2 ? 
  var barPadding = 1;
  var svg = d3.select('svg')  
  var bars = svg.selectAll("rect")
     .data(data_votes);

     // Each data point entered into enter() for processing
     bars.enter()
     .append("rect")
     // .transition()
     //   .duration(1000);

     bars.attr("x", function(d, i) {
        return i * (w / data_votes.length);  //Bar width of 20 plus 1 for padding
    // tying of each bar as a function to length of set, never runs off screen
     })
     .attr("y", function(d){
        return h-d; 
     })
     // Less bars == more width
     .attr("width", w / data_votes.length - barPadding)
     .attr("height", function(d){
        var barHeight = 50*d; 
        return barHeight; 
     })

     .attr("fill", "teal");

     bars.exit().remove();

  bars = svg.selectAll("text")
   .data(data_votes)
   .enter()
   .append("text")
   .text(function(d) {
      console.log('text')
      console.log(d);
      return d;
   })
   bars.attr("x", function(d, i) {
      return i * (w / data_votes.length);  //Bar width of 20 plus 1 for padding
  // tying of each bar as a function to length of set, never runs off screen
   })
   .attr("y", function(d){
      return h-d; 
   }) 
}

$(document).ready(function() {
    var w = 500;
    var h = 420;

    var svg = d3.select('div.graph')
                .append("svg") 
                .attr("width", w)
                .attr("height",h);

  var votes = gon.votes;
  drawSurvey(votes);

});


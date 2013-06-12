function drawSurvey(data_votes){
  console.log('new drawSurvey call')
  var w = 500;
  var h = 420;
  // var height = data_votes.length < 2 ? 
  var barPadding = 1;
  var svg = d3.select('svg')  
  var bars = svg.selectAll("rect")
     .data(data_votes);
     // Each data point entered into enter() for processing
     bars.enter()
     .append("rect");


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
        console.log(d);  
        return d;
     })

     .attr("fill", "teal");

     bars.exit().remove();
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

function redraw(data) {
    var svg = d3.select('svg')
    svg.selectAll("rect")
        .data(data)
      .transition()
        .duration(1000)
        .attr("y", function(d) { return h - y(d.value) - .5; })
        .attr("height", function(d) { return y(d.value); });
}
$(document).ready(function() {
  console.log(gon.poll);
  var w = 500;
  var h = 420;
  var barPadding = 1;
  var dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
                  11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ];
  // var dataset [gon.poll];

  // function drawSurvey(){
    var svg = d3.select('div.graph')
                .append("svg") 
                .attr("width", w)
                .attr("height",h);
                // .attr("class", "bar")
                // });

    svg.selectAll("rect")
       .data(dataset)
       // Each data point entered into enter() for processing
       .enter()
       .append("rect")
       .attr("x", function(d, i) {
          return i * (w / dataset.length);  //Bar width of 20 plus 1 for padding
      // tying of each bar as a function to length of set, never runs off screen
       })
       .attr("y", function(d){
          return h-d
       })
       // Less bars == more width
       .attr("width", w / dataset.length - barPadding)
       .attr("height", function(d){
        return d
       })
       .attr("fill", "teal");

  // }

});
function updateSurvey(all_data){
  var svg = d3.select('svg')
  var bars = svg.selectAll('rect')
      .data(all_data)
      .transition()
      .duration(500)
      .attr("height", function(d){
        barHeight = yScale(d.votes);
        return barHeight;
      })  
}
function drawSurvey(all_data){

  showTotalVotes(gon.votes);  
  var w = 500;
  var h = 420;

  var barPadding = 50;
  var svg = d3.select('svg')  
  var bars = svg.selectAll("rect")
     .data(all_data);
     bars.enter()
     .append("rect")

     bars.attr("x", function(d, i) {
        return i * (w / all_data.length); 
     })
     .attr("y", function(d){
        return h-(d.votes*10); 
     })
     // Less bars == more width
     .attr("width", w / all_data.length - barPadding)
     .attr("height", function(d) {
        return d.votes * 10;
     })
     .attr("rx", 10)

     .attr("fill", "teal");

     bars.exit().remove();

  bars =  svg.selectAll("text")
   .data(all_data)
   .enter()
   .append("text")
   .text(function(d) {
      console.log('text')

      return d.votes;
   })
   .attr("text-anchor", "middle")
   .attr("x", function(d, i) {
      return i * (w / all_data.length) + (w / all_data.length - barPadding) / 2;;  //Bar width of 20 plus 1 for padding
  // tying of each bar as a function to length of set, never runs off screen
   })
   .attr("y", function(d){
      return h-d.votes; 
   }) 
   .attr("fill", "white")
   .attr("font-family", "sans-serif")

  // bars = svg.selectAll("div")
  //   .data(answer_titles)
  //   .enter()
  //   .append("div")
  //   .text(function(d){
  //     console.log(d)
  //     return d;
  //   })
    

} 


$(document).ready(function() {
    var w = 500;
    var h = 420;

    var svg = d3.select('div.graph')
                .append("svg") 
                .attr("width", w)
                .attr("height",h);

  // var votes = gon.poll_data;
  // drawSurvey(votes);
  drawSurvey(gon.answers);  

});


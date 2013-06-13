function drawSurvey(all_data){

  showTotalVotes(gon.votes);  
  var w = 500;
  var h = 420;
  var xOffset = 10;
  var yOffset = 10;
  range = [];


  for (var k =0;k<gon.votes.length; k++){
  range.push(k*w/gon.votes.length + xOffset+30)
  };

  var barPadding = 25;
  var xScale = d3.scale.ordinal()
    .domain(all_data.map(function(d){return d.title;}))
    .range(range);

  var xAxis = d3.svg.axis()
    .tickPadding(5)
    .scale(xScale);
    // .orient("bottom");
    // .tickValues(['hi','b','c','d','e']);
    // .ticks(gon.votes.length, function(d){
    //   return d.title;
    // });

  var yScale = d3.scale.linear()
    .domain([0,d3.max(gon.votes)])
    .range([0,h]);

  var svg = d3.select('svg')  
  var bars = svg.selectAll("rect")
      .data(all_data);

    bars.enter()
      .append("rect")

      bars.attr("x", function(d, i) {
        return (i*w/gon.votes.length + xOffset)
        // return xScale(i) + xOffset
          // return i * (w / all_data.length); 
      })
      .attr("y", function(d){
        return h + (yOffset - yScale(d.votes))
          // return h-(d.votes*10); 
      })
       // Less bars == more width
      .attr("width", w / all_data.length - barPadding)
      .attr("height", function(d) {
          barHeight = yScale(d.votes); 
          return barHeight;
      })
      .attr("rx", 10)
      .attr('id', function(d){
          return d.id;  
          appendTitles(d.id)
      }) 

      .attr("fill", "teal")
      .transition()
      .duration(500);

    bars.exit()
      .transition()
      .duration(500)
      .remove();

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
            return h-yScale(d.votes)+20;
        }) 
        .attr("fill", "white")
        .attr("font-family", "sans-serif")
        .attr("font-size","30 ");



    bars = svg.append("g")
      .call(xAxis)
      .attr("class", "axis")
      .attr("transform", "translate(0," + (h-20) + ")");

    

} 


$(document).ready(function() {
    var w = 500;
    var h = 420;

    var svg = d3.select('div.graph')
                .append("svg") 
                .attr("width", w)
                .attr("height",h);

  drawSurvey(gon.answers);


});


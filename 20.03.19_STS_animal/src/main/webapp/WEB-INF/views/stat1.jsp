<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#chart_div{
		width : 100%;
		height: 400px;
	}
</style>
</head>
<body>
	<h1>2019년 1월 유기견 현황</h1>
	<div id="chart_div"></div>
	
<script src="resources/js/jquery-3.4.1.min.js"></script>	
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script type="text/javascript">
	$(function(){
		
		$.ajax({
			url : "http://localhost:5000/ugiChart",
			type : "post",
			dataType : "json"
			
		}).done(function(data){
			viewChart(data)
		});
		
	});
	
	function viewChart(json_data){
		am4core.ready(function() {

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("chart_div", am4charts.PieChart);

			// Add data
			chart.data = json_data

			// Add and configure Series
			var pieSeries = chart.series.push(new am4charts.PieSeries());
			pieSeries.dataFields.value = "counts";
			pieSeries.dataFields.category = "city";
			pieSeries.slices.template.stroke = am4core.color("#fff");
			pieSeries.slices.template.strokeWidth = 2;
			pieSeries.slices.template.strokeOpacity = 1;

			// This creates initial animation
			pieSeries.hiddenState.properties.opacity = 1;
			pieSeries.hiddenState.properties.endAngle = -90;
			pieSeries.hiddenState.properties.startAngle = -90;

			}); // end am4core.ready()
		
	}
	
</script>	

</body>
</html>
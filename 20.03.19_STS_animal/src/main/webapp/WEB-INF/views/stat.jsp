<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#table{
		margin: 0 auto;
		width: 1000px;
		height: 200px;
	}
	#month{
		text-align: center;
	}
	#m1,#m2,#m3,#m4,#m5,
	#m6,#m7,#m8,#m9,#m10, 
	#m11,#m12,#go{
		padding: 15px;
	}
	       
	#main{ 
		text-align: right;  
		padding: 15px;
	} 
</style> 
</head> 
<body>

	
	<table id="table">   
		<thead>
		<tr>
			<th>
				<h1><b><u>${year }년도 월별 유기견 통계</u></b></h1> 
			</th>
		</tr>
		<tr>
			<td id="month">
				<input type="button" value="1월" id="m1" onclick="goStat('01',${year })"/>&nbsp;&nbsp;
				<input type="button" value="2월" id="m2" onclick="goStat('02',${year })"/>&nbsp;&nbsp;
				<input type="button" value="3월" id="m3" onclick="goStat('03',${year })"/>&nbsp;&nbsp; 
				<input type="button" value="4월" id="m4" onclick="goStat('04',${year })"/>&nbsp;&nbsp;
				<input type="button" value="5월" id="m5" onclick="goStat('05',${year })"/>&nbsp;&nbsp;
				<input type="button" value="6월" id="m6" onclick="goStat('06',${year })"/>&nbsp;&nbsp;
				<input type="button" value="7월" id="m7" onclick="goStat('07',${year })"/>&nbsp;&nbsp;
				<input type="button" value="8월" id="m8" onclick="goStat('08',${year })"/>&nbsp;&nbsp;
				<input type="button" value="9월" id="m9" onclick="goStat('09',${year })"/>&nbsp;&nbsp;
				<input type="button" value="10월" id="m10" onclick="goStat('10',${year })"/>&nbsp;&nbsp;
				<input type="button" value="11월" id="m11" onclick="goStat('11',${year })"/>&nbsp;&nbsp;
				<input type="button" value="12월" id="m12" onclick="goStat('12',${year })"/>&nbsp;&nbsp;
				<input type="button" value="HOME" id="go" onclick="javascript:location.href='main.inc'"/>
			</td>
		</tr>
		</thead>
		<tbody>
		<br/><br/>
		</tbody>
	</table>
	<div id="include_stat"></div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="//www.amcharts.com/lib/4/core.js"></script>
	<script src="//www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	
	

	<script type="text/javascript">
		
		function goStat(num,year){
			console.log(num+"/"+year);
			$("#include_stat").load("stat1.inc?num="+num+"&year="+year);
		}
		 $(function(){
				$("#include_header").load("header.inc");
			  });
	</script>
	</body>
</html>
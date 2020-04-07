<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<tr>
			<th>
				<h1><b><u>2019년도 월별 유기견 통계</u></b></h1> 
			</th>
		</tr>
		<tr>
			<td id="month">
				<input type="button" value="1월" id="m1"/>&nbsp;&nbsp;
				<input type="button" value="2월" id="m2"/>&nbsp;&nbsp;
				<input type="button" value="3월" id="m3"/>&nbsp;&nbsp; 
				<input type="button" value="4월" id="m4"/>&nbsp;&nbsp;
				<input type="button" value="5월" id="m5"/>&nbsp;&nbsp;
				<input type="button" value="6월" id="m6"/>&nbsp;&nbsp;
				<input type="button" value="7월" id="m7"/>&nbsp;&nbsp;
				<input type="button" value="8월" id="m8"/>&nbsp;&nbsp;
				<input type="button" value="9월" id="m9"/>&nbsp;&nbsp;
				<input type="button" value="10월" id="m10"/>&nbsp;&nbsp;
				<input type="button" value="11월" id="m11"/>&nbsp;&nbsp;
				<input type="button" value="12월" id="m12"/>&nbsp;&nbsp;
				<input type="button" value="메인으로" id="go" onclick="javascript:location.href='main.inc'"/>
			</td>
		</tr>
	</table>
	</body>
</html>
<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Object obj = session.getAttribute("mvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="resources/css/text.css" rel="stylesheet" type="text/css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

	<style>
	.marker{
		width:150px;
		text-align:center;
		padding:6px 0;
		font-size: 11px;
		color: red;
	}
	table{
		width: 800px;
		margin: auto;
	}
	td{
		padding-left: 85px;
		font-size: 30px;
		font-weight: bold;
		font-family: monospace;
		text-shadow: 0px 1px #ffffff, 4px 4px 0px #dad7d7;
	}
	th{
		text-align: center;
		font-size: 20px;
		font-family: sans-serif;
	}
	.map{
		text-align: center;
	}
	h1{
		font-size: 50px;
	}
	
	.btn{
   	position: absolute;

  	right: 300px;

	bottom: 180px;
   }
   #t1 {
   	width:100%; 
   	height: 100px;
   }
   .top{
	   	width: 90%;
	   	margin: 0 auto;
   }
   #top1{
   		font-size: 30px;
		font-weight: bold;
		font-family: monospace;
		text-shadow: 0px 1px #ffffff, 4px 4px 0px #dad7d7;
   }
   #top2{
   		text-align: center;
		font-size: 20px;
		font-family: sans-serif;
		font-weight: bold;
   }
  
	</style>
</head>
<body>
<!--head-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<%
   if(obj == null){ 
%>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand"  href="main.inc">
                <img class="img-fluid" src="resources/images/logo.PNG" width>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="ml-auto navbar-nav text-uppercase">
                    <li class="nav-item">
                        <a class="nav-link p-3" href="list.inc">유기견 공고</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-3" href="bbslist.inc?bname=유기">분실 신고</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-3" href="login.inc">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-3" href="reg.inc">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>	
<%
   }else{
      AnimemVO vo = (AnimemVO)obj;
%>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand"  href="main.inc">
                <img class="img-fluid" src="resources/images/logo.PNG" width>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="ml-auto navbar-nav text-uppercase">
                    <li class="nav-item">
                        <a class="nav-link p-3" href="list.inc">유기견 공고</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link p-3" href="bbslist.inc?bname=유기">분실 신고</a>
                    </li>
                    <li class="nav-item">
                         <%= vo.getM_name() %>님 환영합니다.
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.inc">로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>	
<%
   }
%>
<div class="container" style="margin-top: 30px;">
	<div class="top">
			<p id="top1"><i class="fas fa-home"></i>&nbsp;주소</p>
			<hr>		
			<p id="top2">${careAddr }</p>
	</div>
	<div id="map" style="width:1000px; height:500px; margin: 0 auto;">	</div>
	<hr style="width:1000px;">
</div>	
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18e1f0667ae14a856c08b9b48db95b3a&libraries=services,clusterer,drawing"></script>
 
 <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
 
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script src="resources/js/jquery-ui.min.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${careAddr }', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:180px;text-align:center;padding:6px 0;">${careNm }<br/>${careTel }</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});  

  
 </script>
</html>
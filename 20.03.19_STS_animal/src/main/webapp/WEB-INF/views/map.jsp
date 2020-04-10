<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	</style>
</head>
<body>
	<table>
		<tr>
			<th>${careAddr }</th>
		</tr>
	</table>
	<div id="map" style="width:1000px; height:500px; margin: 0 auto;"></div>
	
	
		
	<input type="button" class="btn" value="목록" onclick="javascript:location.href='view.inc?nowPage=${nowPage}&desertionNo=${desertionNo}'"/>
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18e1f0667ae14a856c08b9b48db95b3a&libraries=services,clusterer,drawing"></script>

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
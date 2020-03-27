<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>부트스트랩</title> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<style type="text/css">

   .carousel-inner > .carousel-item > img{
    width: 400px; 
    height: 500px;
    }

   body{ /* body를 화면 가장자리로 보낸다. */
      padding: 0;
      margin: 0;
   }
   
   div#header{  /* div(범위)를 화면 가장자리로 보낸다. */
      height: 44px;
      margin: 0;
      color: #fff;
      background-color: white;
   }
   
   ul#menu{
      margin: 0;
      padding: 0;
      list-style: none;
      font: 15px sans-serif;
      line-height: 44px;
      text-align: center;
   }
   
   ul#menu>li{
      display: inline-block;
      width: 125px;
   }
   
   ul#menu>li>a{
      color: black;
      text-decoration: none;
   }
   
   ul#menu>li>a:hover {
      color: black;
      font-size: 16px;
      font-weight: bold;
   }
   
   #bar_up{
      margin: 3px;
      padding-top: 20px;
      padding-left: 450px;
   }
   
   #demo{
      display: inline-block;
      width: 600px;
      margin-top: 50px;
      margin-left: 450px;
   }
   
   #right{
      display: inline-block;
      width: 400px;
      height: 500px;
      margin-top : 100px;
      margin-left: 70px;
   }
   
   #t2{
      width: 300px;
      height: 200px;
      background-color: #efefef;
   }
   
   #t3{
      margin-top: 30px;
      width: 310px;
      height: 300px;
      background-color: #efefef;
   }
   #btn{
   }
   #m_btn{
      text-align: right;
   }
   
   #pp{
      font-size: 16px;
      color: #111;
      font-family: cursive;
      width: 100%;
      
   }
</style>
</head>
<body>
   <!-- 메뉴바 작업 -->
   <div id="header">
      <ul id="menu">
         <li><a href="javascript:location.href='list.inc'">유기동물</a></li>
         <li><a href="">동물등록</a></li>
         <li><a href="">농장동물</a></li>
         <li><a href="">TNR</a></li>
         <li><a href="">정보마당</a></li>
         <li><a href="">업체정보</a></li>
         <li><a href="javascript:location.href='pubData.inc'">정책정보</a></li>
      </ul>
   </div>
    <!-- 로그인 -->
   <div>
   		<button type="button" name="login_btn" value="로그인" onclick="javascript:location.href='login.inc'">로그인</button>
   </div>
   <!-- 상단 이미지 작업 -->
   <div id="bar_up">
      <img src="resources/images/bar_up.JPG"/>
   </div>
   
   <!-- 부트스트랩 이용해서 클릭시 이미지 전환 -->
   <div class="container">
   </div> 
   <div id="demo" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner"> <!-- 슬라이드 쇼 --> 
         <div class="carousel-item active"> <!--가로--> 
         <img class="d-block w-100" src="resources/images/boot1.JPG" alt="First slide"> 
         <div class="carousel-caption d-none d-md-block"> 
         </div> 
         </div> 
         <div class="carousel-item"> 
         <img class="d-block w-100" src="resources/images/boot2.JPG" alt="Second slide"> 
         </div> 
         <div class="carousel-item"> 
         <img class="d-block w-100" src="resources/images/boot3.JPG" alt="Third slide"> 
         </div> <!-- / 슬라이드 쇼 끝 --> 
         <!-- 왼쪽 오른쪽 화살표 버튼 --> 
         <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
         <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
         <!-- <span>Previous</span> --> 
         </a> 
         <a class="carousel-control-next" href="#demo" data-slide="next"> 
         <span class="carousel-control-next-icon" aria-hidden="true"></span> 
         <!-- <span>Next</span> --> 
         </a> <!-- / 화살표 버튼 끝 --> 
         <!-- 인디케이터 --> 
         <ul class="carousel-indicators"> 
         <li data-target="#demo" data-slide-to="0" class="active">
         </li> 
         <!--0번부터시작--> 
         <li data-target="#demo" data-slide-to="1"></li> 
         <li data-target="#demo" data-slide-to="2"></li> 
         </ul> <!-- 인디케이터 끝 --> 
      </div>
   </div>   
      
   <!-- 오른쪽 공지사항 영역 -->
   <div id="right">
      <table id="t2">
         <thead id="pp">
            <tr>
               <th>
                  <a href="pubData.inc">공지사항</a>
               </th>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>
                  동물보호관리시스템 개편 안내
               </td>
            </tr>
            <tr>
               <td>
                  동물등록증 발급 방법 안내
               </td>
            </tr>
            <tr>
               <td>
                  동물보호법 및 하위법령
               </td>
            </tr>
            <tr>
               <td>
                  동물복지축산농장 정기교육 취소 알림
               </td>
            </tr>
         </tbody>
      </table>
      
      <table id="t3">
         <thead id="pp">
            <tr>
               <th>
                  <a href="pubData.inc">유기동물 공고</a>
               </th>
               <td id="btn"  align="right">
                  <button id="m_btn" type="button" value="더보기" onclick="javascript:location.href='list.inc'" align="right">더보기</button>
               </td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td colspan="2">
                  <a href="javascript:location.href='view.inc?desertionNo=429362201400243'">
                  광주시 북구 본촌마을길
                  </a>
               </td>               
            </tr>
            <tr>
               <td>
                  <a href="javascript:location.href='view.inc?desertionNo=431370201400365'"><img src="resources/images/1_ugi.jpg" width="80" /></a> 
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <a href="javascript:location.href='view.inc?desertionNo=431370201400365'">
                  울산시 남구 대학로
                  </a>
               </td>
            </tr>
            <tr>
               <td>
                  <a href="javascript:location.href='view.inc?desertionNo=431370201400365'"><img src="resources/images/3_ugi.jpg" width="80" /></a>
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   
   <!-- 공지사항 밑  -->
   <div>
      
   </div>


   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
   </script> 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
   <script> $('.carousel').carousel({ interval: 2000 //기본 5초 }) </script> 


</body>
</html>
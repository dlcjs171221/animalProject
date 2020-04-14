<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Object obj = session.getAttribute("mvo");
%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  

  <title>Shop Homepage - Start Bootstrap Template</title>


   

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop-homepage.css" rel="stylesheet">
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">

   
   
   
   
   
</head>
<style>
   #bar_up{
      margin: 3px;
      padding-top: 20px;
      padding-left: 390px;
   }
   .ul{
     width:230px; 
     border:3px solid #ccc; 
     border-radius:8px; 
     margin:10px 0 0 10px; 
     list-style:none;
   }
   
   .ul li{
     padding:10px 0 0 10px; 
     border-top:1px dotted #ccc; 
     margin-bottom:10px;
   }
   
   .ul li:first-child{
     border:0 none;
   }
   
   .ul li a{
     height:20px; 
     line-height:20px; 
     display:block; 
     text-decoration:none; 
     color:#000;
   }
   .ul li p{color:blue;}
   
   #t3{
      margin-top: 30px;
      width: 255px;
      height: 300px;
      background-color: #efefef;
   }
   #carouselExampleIndicators{
      width: 850px;
   }
   .carousel-inner{
      width: 800px;
      height: 380px;
      margin-left: 30px;
      padding-left: 50px;
   }
   .row{
      margin-bottom: 50px;
   }
   #id{
   	margin-top: 5px;
   	color: white;
   }
   p{
   	color:#000;
   }
   .search{
   	 width: 700px;
   	 text-align: right;
   }
   
</style>

<body>

<!-- 메인 이미지 -->
<div id="bar_up">
   <img src="resources/images/bar_up.JPG" width="1115">
</div>
<%
	if(obj == null){ 
%>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <a class="nav-link" href="main.inc"><img alt="mainlogo" src="resources/images/logo.PNG" width="150px" height="35px"><span class="sr-only">(current)</span></a>
    		<a href="list.inc" class="navbar-item">유기동물 공고</a>
    		<a href="bbslist.inc?bname=유기" class="navbar-item">유기등록 등록</a>
    		<a href="shelter.inc" class="navbar-item">유기 관찰소 찾기</a>
            <a href="bbslist.inc?bname=정책" class="navbar-item">유기동물 정책</a>
            <button type="button" class="btn btn-default dropdown toggle,navbar-item" data-toggle="dropdown"><span class="caret" ><p class="text-primary">유기동물 통계</p></span></button>
    		<ul class="dropdown-menu" role="menu" style="text-align: center;">
	            <li><a href="javascript:goStat('2010')">2010년</a></li>
	            <li><a href="javascript:goStat('2011')">2011년</a></li>
	            <li><a href="javascript:goStat('2012')">2012년</a></li>
	            <li><a href="javascript:goStat('2013')">2013년</a></li>
	            <li><a href="javascript:goStat('2014')">2014년</a></li>
            	<li><a href="javascript:goStat('2015')">2015년</a></li>
            	<li><a href="javascript:goStat('2016')">2016년</a></li>
            	<li><a href="javascript:goStat('2017')">2017년</a></li>
                <li><a href="javascript:goStat('2018')">2018년</a></li>
                <li><a href="javascript:goStat('2019')" >2019년</a></li>
                <li><a href="javascript:goStat('2020')" >2020년</a></li>
            </ul>
     <div class="search">
      <input type="text" style="width:130px;" placeholder="단어 입력"/>&nbsp;&nbsp;&nbsp;<input type="button" value="검색"/>
     </div>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>   
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"></li>
          <li class="nav-item">
            <a class="nav-link" href="login.inc">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reg.inc">회원가입</a>
          </li>
        </ul>  
       </div>
    </div>
    <br/><br/>
  </nav>
<%
	}else{
		AnimemVO vo = (AnimemVO)obj;
%>  
	<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">검색영역</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>   <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="main.inc">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
         <li class="nav-item" id="id">
         <%= vo.getM_name() %>님 환영합니다.
         </li>
         <li class="nav-item">
            <a class="nav-link" href="logout.inc">로그아웃</a>
          </li>
        </ul>  
       </div>
    </div>
  </nav>
<%
	}
%>



  <!-- Page Content -->
  <div class="container">
    <div class="row">
	   <br/><br/>
	   

      <div class="col-lg-3">
        <div class="list-group" style="text-align: center;">
        <div id="stat1"></div>
           
          <a href="list.inc" class="list-group-item">유기동물 공고</a>
          <a href="bbslist.inc?bname=유기" class="list-group-item">유기등록 등록</a>
          <a href="shelter.inc" class="list-group-item">유기 관찰소 찾기</a>
          <a href="bbslist.inc?bname=정책" class="list-group-item">유기동물 정책</a>
          <div class="list-group-item">
            <button type="button" class="btn btn-default dropdown toggle,list-group-item" data-toggle="dropdown"><span class="caret" ><p class="text-primary">유기동물 통계</p></span></button>
            <ul class="dropdown-menu" role="menu" style="text-align: center;">
	            <li><a href="javascript:goStat('2010')">2010년</a></li>
	            <li><a href="javascript:goStat('2011')">2011년</a></li>
	            <li><a href="javascript:goStat('2012')">2012년</a></li>
	            <li><a href="javascript:goStat('2013')">2013년</a></li>
	            <li><a href="javascript:goStat('2014')">2014년</a></li>
            	<li><a href="javascript:goStat('2015')">2015년</a></li>
            	<li><a href="javascript:goStat('2016')">2016년</a></li>
            	<li><a href="javascript:goStat('2017')">2017년</a></li>
                <li><a href="javascript:goStat('2018')">2018년</a></li>
                <li><a href="javascript:goStat('2019')" >2019년</a></li>
                <li><a href="javascript:goStat('2020')" >2020년</a></li>
            </ul>
        </div>
          
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">             
              <a href="https://apms.epis.or.kr/wilddog/IndexMain3"><img class="d-block img-fluid" src="resources/images/boot1.JPG" width="680" height="350" alt="First slide"></a>
            </div>
            <div class="carousel-item">
              <a href="http://www.mafra.go.kr/mafra/355/subview.do;jsessionid=X31CHBZ8iATuQsXT2kBqvvV2.inst21?enc=Zm5jdDF8QEB8JTJGYmJzJTJGbWFmcmElMkY2NCUyRjMxOTA2MyUyRmFydGNsVmlldy5kbyUzRg%3D%3D"><img class="d-block img-fluid" src="resources/images/boot2.JPG" width="680" height="350" alt="Second slide"></a>
            </div>
            <div class="carousel-item">
              <a href="https://www.animal.go.kr/front/community/show.do?boardId=boardID06&menuNo=7000000006&seq=300000"><img class="d-block img-fluid" src="resources/images/boot3.JPG" width="680" height="350" alt="Third slide"></a>
            </div>
            <div class="carousel-item">
              <a href="https://apms.epis.or.kr/"><img class="d-block img-fluid" src="resources/images/boot4.JPG" width="680" height="350" alt="Third slide"></a>
            </div>
            <div class="carousel-item">
              <a href="http://www.mafra.go.kr/mafra/1374/subview.do"><img class="d-block img-fluid" src="resources/images/boot5.JPG" width="680" height="350" alt="Third slide"></a>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

        <div class="row">

         <div class="col-lg-4 col-md-6 mb-4">
           <table id="t3">
            <thead id="pp">
               <tr>
                  <th>
                     <a href="pubData.inc">???</a>
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
          </div>


          <div class="col-lg-4 col-md-6 mb-4">
            
            <table id="t3">
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
          </div>


      <!-- 유기 공고 -->
          <div class="col-lg-4 col-md-6 mb-4">
          
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

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <!-- 아코디언 스크립트 -->
  <script src="resources/js/jquery-3.4.1.min.js"></script>
  <script src="resources/js/jquery-ui.min.js"></script>
  <script>
  function goStat(year){
	  console.log(year);
	  location.href="stat2.inc?year="+year;
			
	}
  </script>
</body>

</html>
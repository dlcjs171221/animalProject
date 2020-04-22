<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <a class="nav-link" href="main.inc"><img alt="mainlogo" src="resources/images/logo.PNG" width="150px" height="35px"><span class="sr-only">(current)</span></a>
    		<a href="list.inc" class="navbar-item"><p class="text-primary">유기동물 공고</p></a>
    		<a href="bbslist.inc?bname=유기" class="navbar-item"><p class="text-primary">유기등록 등록</p></a>
    		<a href="shelter.inc" class="navbar-item"><p class="text-primary">유기 관찰소 찾기</p></a>
            <a href="bbslist.inc?bname=정책" class="navbar-item"><p class="text-primary">유기동물 정책</p></a>
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
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
        <c:if test="${sessionScope.mvo eq null }">
          <li class="nav-item">
            <a class="nav-link" href="login.inc">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reg.inc">회원가입</a>
          </li>
        </c:if>
        
        <c:if test="${sessionScope.mvo ne null }">
          <li class="nav-item" id="id">
         	${sessionScope.mvo.m_name }님 환영합니다.
         </li>
         <li class="nav-item">
            <a class="nav-link" href="logout.inc">로그아웃</a>
          </li>
        </c:if>
        
        </ul>  
       </div>
    </div>
    <br/><br/>
  </nav>

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
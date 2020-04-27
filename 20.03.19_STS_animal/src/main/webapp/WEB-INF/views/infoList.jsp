<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%
	Object obj = session.getAttribute("mvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<style>
	._t1{
		width: 1300px;
	}
	.t1{
		width: 100%;
		border: 1px solid black;
	}
	.t1 td{
		border: 1px solid black;
	}
	h1{
   		margin: 20px 20px;
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

 <div class="container" id="tourpackages-carousel">       
    <h1>총 ${rowTotal } 건</h1>          
    <hr>
	<div class="table-responsive">	
		<table class="table table-striped table-sm" height="400px" style="text-align: center;">
			<thead>
	            <tr bgcolor="#F8E0F7" >
	                <td style="font-size: 20px; font-weight: bold;" >번호</td>
	                <td style="width: 50%; font-size: 20px; font-weight: bold;">제목</td>
	                <td style="font-size: 20px; font-weight: bold;">작성일</td>              
	                <td style="font-size: 20px; font-weight: bold;">조회수</td>                
	            </tr>
	        </thead>	        
	        <tbody >	
	        	<c:forEach var="vo" items="${infoList}" varStatus="st">
	        	<tr >
	        		<td style="font-size: 15px">
	        		<!-- 번호
					전체게시물수-((현재페이지-1)*한페이지당 보여질 게시물 수+인덱스)
                    --> 
	        		${rowTotal-((nowPage-1)*blockList+st.index) }
	        		<!-- 작은수부터 찍을 때는 st.index -->
	        		</td>
	        		<td style="font-size: 15px">
	        		<!-- 제목 (get 요청에 bname추가함)-->
	        		<a href="infoview.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}&bname=${vo.bname}">
	        			${vo.subject }
	        		</a>
	        		</td>
	        		<td style="font-size: 15px">
	        		<!-- 작성일 -->
	        		${fn:substring(vo.write_date,0,10) }
	        		</td>
	        		<td style="font-size: 15px">
	        		<!-- 조회수 -->
	        		${vo.hit }
	        		</td>
	        	</tr>
	        	</c:forEach>        	
	        </tbody>
	        <tfoot>
	       		<tr>
	       			<td colspan="4" style="text-align: right;">
		       			<div style="width: 400px; display: inline-block; margin-right: 200px; padding: 5px;">
		       				${infoPageCode }
		       			</div>
		       			<button type="button" class="btn btn-info btn-xs"  style="color: white;" onclick="javascript:location.href='infowrite.inc?bname=${bname }'">${bname }쓰기</button>
			        </td>	
	        	</tr>
	        </tfoot>	
	      </table>
	</div>
	 <hr>
</div>	
  <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
	
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script src="resources/js/jquery-ui.min.js"></script>
  
</body>
</html>
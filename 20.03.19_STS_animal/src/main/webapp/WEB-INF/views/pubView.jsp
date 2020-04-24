<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	Object obj = session.getAttribute("mvo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link href="resources/css/text.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">


<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<style>
	#t1{
		border: 1px solid black;

	}
	#t1 td{
		border: 1px solid black;
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
<div class="container" style="height: 1000px;">
		<br/><br/><hr style="margin-top: 80px;">
		<table style=" text-align: center; width: 800px; height:500px; margin: 0 auto; margin-top: 100px;">
	         <tr>
	            <th style="font-size:20px;" align="center" bgcolor="#F8E0F7" width="100">
	              제목
	            </th>
	            <td style=" font-size:15px;" colspan="3" bgcolor="#EFFBEF" >
	               <!-- 특징 -->
	               ${vo.subject }
	            </td>
	         </tr>
	         <tr>
	            <th style="font-size:20px;" align="center" bgcolor="#F8E0F7" width="100">
	              작성일
	            </th>
	            <td style=" font-size:15px;" colspan="3" bgcolor="#EFFBEF" >
	               <!-- 공고기한 -->
	               ${vo.write_date }
	            </td>
	         </tr>
	         <tr>
	            <th style="font-size:20px;" align="center" bgcolor="#F8E0F7" width="100">
	               조회수
	            </th>
	            <td style=" font-size:15px;" colspan="3" bgcolor="#EFFBEF" >
	               <!-- 특징 -->
	              ${vo.hit }
	            </td>
	         </tr>
	         <tr>
	         	<th style="font-size:20px;" align="center" bgcolor="#F8E0F7" width="100">
	              내용
	            </th>
				<td style=" font-size:15px;" colspan="3" bgcolor="#EFFBEF">
					${vo.content }
				</td>
			</tr>
			<tr>
				<th style="font-size:20px;" align="center" bgcolor="#F8E0F7" width="100">
					첨부파일
				</th>
				<td style=" font-size:15px;" colspan="3" bgcolor="#EFFBEF" >
				
				<c:if test="${vo.file_name != null and fn:length(vo.file_name) > 4}">
					<a href="javascript:fDown('${vo.file_name }')">	
						<b><u>${vo.file_name }</u></b>
					</a>
				</c:if>
				</td>
			</tr>
			<!-- m_id가 master일 때만 수행하는 수정기능 -->
			<tr>
				<td colspan="4" style="text-align: right;">
					<input type="button" value="수정" class="btn btn-info btn-xs"  style="color: white;" onclick="javascript:location.href='bbsedit.inc?b_idx=${vo.b_idx}&nowPage=${param.nowPage }'"/>
				</td>
			</tr>
	   </table>
		<hr style="margin-top: 80px;">
		<form name="frm" method="post">
			<input type="hidden" name="f_name" />
			<input type="hidden" name="b_idx" value="${param.b_idx }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<!-- bname추가함 -->
			<input type="hidden" name="bname" value="${param.bname }">
		</form>
	
</div>
	<!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script>
		
		function fDown(fname) {
			console.log(fname);
			document.frm.f_name.value = fname;
			document.frm.action = "FileDownload";
			
			
			document.frm.submit();
		}
		
		
	</script>
</body>
</html>
<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Object obj = session.getAttribute("mvo");
%>
  <!-- 날짜 사용시 사용(substring) -->
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">


<style type="text/css">

	#sea{
		text-align: center;
		height: 80px;
	}
	#hi{
		display: none;
	}
</style>

</head>
<body topmargin=0 leftmargin=0 marginwidth="0" marginheight="0"> 
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

<div class="container">
<!--주요내용시작 -->
<form name="ff2" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 30px;">
  <tbody>
  		  <tr>
		<td valign="top">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  
			<tr>
			  <td align="center" height="10"></td>
			</tr>
			<tr>
			  <td align="center" ><h1><u><b>보호센터 목록</b><u></td>
			</tr>
			<tr>
				<td id="sea">
					<select id="select"  name="select">
						<option value="1">전체</option>
						<option value="2">관할구역</option>
						<option value="3">보호센터명</option>
						<option value="4">전화번호</option>
						<option value="5">보호센터주소</option>
					</select>&nbsp;&nbsp; 
					<input type="text" id="search" name="search" placeholder="검색어 입력"/>&nbsp;&nbsp;
					<input type="text" id="hi"/>
					<input type="button" id ="btn" value="조회"/>
					
					<hr  width="100%">
				</td>
			</tr>

			<tr>
			  <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td>&nbsp;</td>
				  </tr>
				</table>
				<table width="556" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<td height="2" bgcolor="#C3C3C3"></td>
				  </tr>
				  <tr>
					<td bgcolor="#EFFBEF">
					<table id="t1" style="width: 800px; height:100%;" border="0" cellspacing="1" cellpadding="2">
						<thead>
							<tr>
							  <td height="20" align="center" bgcolor="#F8E0F7" width="100">관할구역</td>
							  <td height="20" align="center" bgcolor="#F8E0F7" width="100">보호센터명</td>
							  <td height="20" align="center" bgcolor="#F8E0F7" width="80">전화번호</td>
							  <td height="20" align="center" bgcolor="#F8E0F7" width="230">보호센터주소</td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					 </table>
					 </td>
					  
				  </tr>
		
				</table>
				
				
				<table width="556" border="0" cellspacing="0" cellpadding="0">
				  <tr>
						<td height="20" valign="middle"><img src="resources/images/sub_it/point_line.gif" width="556" height="3"></td>
						 </tr>
				  <tr>
				  		
						<td align="right">
						  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							  <td width="315" align="left">
						  		</td>
						  
						</tr>
					  </table></td>
				  </tr>
				  
				</table></td>
			</tr>
			<tr>
			  <td height="19">&nbsp;</td>
			</tr>
		  </table>
		</td>
	  </tr>
  </tbody>
</table>
</form>
</div>
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script src="resources/js/jquery-ui.min.js"></script>
   <script type="text/javascript"></script>
   
  <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
  
<script>
$(function(){
	
	$("#btn").bind("click",function(){
		
		var type = $("#select").val();
		var value = $("#search").val();
				
		var param = "type="+encodeURIComponent(type)+"&value="+encodeURIComponent(value);
		
		$.ajax({ 
			url: "search.inc",
			type: "post",
			data: param,
			dataType: "json"
		}).done(function(data){
			console.log(data);
			if(data.ar != undefined){
				var code = "";
				for(var i=0; i<data.ar.length; i++){
					code += "<tr><td>";
					code += data.ar[i].s_area;
					code += "</td><td>";
					code += data.ar[i].s_name;  
					code += "</td><td>";
					code += data.ar[i].s_tel;
					code += "</td><td>";
					code += data.ar[i].s_addr;
					code += "</td></tr>";
				}
				//위에서 작어된 HTML코드를 tbody에
				//HTML로 적용한다.
				$("#t1 tbody").html(code);
			}
		}).fail(function(err){
			console.log(err);
		});
		
		if(type>1 && value.length==0){
			alert("검색어를 입력하세요")
		}
		
	});
	
	$("#search").keydown(function(key) {
        if (key.keyCode == 13) {
        	var type = $("#select").val();
    		var value = $("#search").val();
    				
    		var param = "type="+encodeURIComponent(type)+"&value="+encodeURIComponent(value);
    		
    		$.ajax({ 
    			url: "search.inc",
    			type: "post",
    			data: param,
    			dataType: "json"
    		}).done(function(data){
    			console.log(data);
    			if(data.ar != undefined){
    				var code = "";
    				for(var i=0; i<data.ar.length; i++){
    					code += "<tr><td>";
    					code += data.ar[i].s_area;
    					code += "</td><td>";
    					code += data.ar[i].s_name;  
    					code += "</td><td>";
    					code += data.ar[i].s_tel;
    					code += "</td><td>";
    					code += data.ar[i].s_addr;
    					code += "</td></tr>";
    				}
    				//위에서 작어된 HTML코드를 tbody에
    				//HTML로 적용한다.
    				$("#t1 tbody").html(code);
    			}
    		}).fail(function(err){
    			console.log(err);
    		});
    		
    		if(type>1 && value.length==0){
    			alert("검색어를 입력하세요")
    		}
        }
    });
});

</script>
</body>
</html>
    
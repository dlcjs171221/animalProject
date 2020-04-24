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
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">


<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

</head>
<style>
	.div{
		width: 1140px;
		margin: 0 auto;
		margin-top: 200px;
		
	}
	.div1{
		display: inline-block;	
		width: 540px;
		height: 500px;
	}
	table td{
		padding-bottom: 7px;
		padding-top: 7px;
	}
	p{
		font-weight: bold;
		color: red;
		font-style: italic;
		font-size: 17px;
	}
</style>
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
<div class="container">
<div class="div" style="text-align: center;">
	<div class="div1" >
          <img src="${vo.popfile }" style="display: block;" width="100%" height="500px">
  	</div>
			
	<div class="div1" >
		<table style="text-align: center; width: 100%;">
			<tbody> 
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               공고번호
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 공고번호 -->
	               ${vo.noticeNo }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               품종
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 품종 -->
	               ${vo.kindCd }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               색상
	            </td >
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 색상 -->
	               ${vo.colorCd }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               성별
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 성별 -->
	               ${vo.sexCd }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               나이/체중
	            </td >
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 나이/체중 -->
	               ${vo.age } / ${vo.weight }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               접수일시
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 접수일시 -->
	               ${vo.happenDt }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               발생장소
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 발생장소 -->
	               ${vo.happenPlace }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               특징
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 특징 -->
	               ${vo.specialMark }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               공고기한
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               <!-- 공고기한 -->
	               ${vo.noticeSdt } ~ ${vo.noticeEdt }
	            </td>
	         </tr>
	     	<tr>
	      		<td colspan="4"><p>** 유기동물 문의는 보호센터에 연락하시기 바랍니다. </p></td>
	   		</tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               보호센터이름
	            </td>
	            <td bgcolor="#EFFBEF" >
	               ${vo.careNm }
	            </td>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               전화번호
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               ${vo.careTel }
	            </td>
	         </tr>
	         <tr style="height: 50px;">
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               보호장소
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF">
	            <!-- 보호장소 클릭시 map.inc로 보내 지도로 보내는 위도와 경도를 구하게 함 -->
	              <a href="javascript:sendData('${vo.careAddr }','${param.nowPage}','${vo.careTel }','${vo.careNm }','${vo.desertionNo }')">${vo.careAddr }</a>
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               관할기관
	            </td>
	            <td colspan="3" bgcolor="#EFFBEF" >
	               ${vo.orgNm }
	            </td>
	         </tr>
	         <tr>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               담당자
	            </td>
	            <td bgcolor="#EFFBEF" >
	               ${vo.chargeNm }
	            </td>
	            <td height="20" align="center" bgcolor="#F8E0F7" width="70">
	               연락처
	            </td>
	            <td bgcolor="#EFFBEF" >
	               ${vo.officetel }
	            </td>
	         </tr>
	      </tbody>
	   </table>
	</div>
</div>  
</div>
    <form name="frm" action="map.inc" method="post">
   	<input type="hidden" name="careAddr" value="${vo.careAddr }"/>
   	<input type="hidden" name="nowPage" value="${param.nowPage }"/>
   	<input type="hidden" name="careTel" value="${vo.careTel }"/>
   	<input type="hidden" name="careNm" value="${vo.careNm }"/>
   	<input type="hidden" name="desertionNo" value="${vo.desertionNo }"/>
   	
   </form>
   
  <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
 
   <script>
   	  	function sendData(addr, np,tel,nm,dno){
   		document.frm.careAddr.value = addr;
   		document.frm.nowPage.value = np;
   		document.frm.careTel.value = tel;
   		document.frm.careNm.value = nm;
   		document.frm.desertionNo.value = dno;
   		
   		document.frm.submit();
   	}
   	  	
   </script>
</body>
</html>






















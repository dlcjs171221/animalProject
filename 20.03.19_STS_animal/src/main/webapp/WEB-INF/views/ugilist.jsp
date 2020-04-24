<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>  
<% 
   Object m_obj = session.getAttribute("mvo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">

<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="resources/js/bootstrap.min.js"></script>
<style type="text/css">
   .container{
      
   }
   
   .t1{
   
      width: 100%;
      height : 180px;
   }
   .t1 tbody tr td{
      color: black;
   }
   .intr{
         
         background-color: #F5F6CE;
         padding: 20px 20px;         
   }

   .intr p{
         font-size: 15px;
   }
   
   #pt{

      width: 1194px;
    margin: 0 auto;
            
   }
   #pg{
      margin: 0 auto;
   }
   
   #btn{
      border: 1px solid skyblue;
      width: 100px;
      background-color: rgba(0,0,0,0);
      color: skyblue;
      border-radius: 5px;
      padding: 5px;
   }
   #btn:hover{
      color:white; 
      background-color: skyblue;
   }
   h1{
   	margin: 20px 20px;
   }
    #main {
         text-align: right;         
         margin: 0 auto;
         padding: 10px;
         height: 60px;
   }

    
   
</style>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>

   <%
   if(m_obj == null){ 
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
      AnimemVO vo = (AnimemVO)m_obj;
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
       
       <div class="intr">
          <p>
                                         
                                         
               여기는 동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.<br />
                    동물을 분실한 경우 동물보호법 제12조제1항 및 같은 법 시행규칙 제8조제1항 및 제9조제2항에 따라 등록대상동물을<br />
                    10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.(다만, 동물보호관리시스템에서 소유자가 직접 동물상태 수정 가능)<br />
                    로그인 후 분실신고를 등록할 수 있습니다.<br />            
          </p>
      </div>
      
      <h1>총 ${rowTotal }건</h1>
            
      <div class="row" >
           <c:forEach var="vo" items="${ugiList }" varStatus="st"> 
        <div class="col-xs-18 col-sm-6 col-md-3" style= "height: 300px;">
          <div class="thumbnail">
            
              <div class="caption">
                <table class="t1">
                   <tbody>
                      <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                              번호
                            </td>
                          <td align="center" bgcolor="#EFFBEF" > 
                              ${rowTotal-((nowPage-1)*blockList+st.index) }
                          </td>
                       </tr>
                          <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             접수일자
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                           	  ${fn:substring(vo.write_date,0,10) }
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             품종
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                              ${vo.kind}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             작성자
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                              ${vo.writer}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             제목
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.subject}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
							조회수
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.hit}
                          </td>   
                       </tr>
                   </tbody>
							<p><a href="ugiview.inc?b_idx=${vo.b_idx}&nowPage=${nowPage }" class="btn btn-info btn-xs" role="button" style="color: white;">자세히보기</a></p>
                
                </table>
            </div>
          </div>
        </div>
      </c:forEach>

      </div><!-- End row -->
      
       <table style="display:inline-block; width: 100%; height: 40px; ">
                 <tr >
                    <td style=" padding-left: 450px; ">
                       ${ugiPageCode }&emsp;<br/><br/><br/><br/><br/>
                    </td> 
                 </tr>
        </table>
        <div id="main">
            <input type="button" class="btn btn-info btn-xs"  style="color: white; height: 100%; width:120px;" value="등록하기" onclick="javascript:location.href='ugiwrite.inc?bname=유기'"/>
      	 </div>
          
      
    </div><!-- End container -->
   
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   
   <script type="text/javascript">

   </script>


</body>
</html>
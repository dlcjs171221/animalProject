<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
   Object m_obj = session.getAttribute("mvo");
   Object obj = session.getAttribute("startdate");
   Object obj2 = session.getAttribute("enddate");
      String startdate = "";
      String enddate = "";
      if(obj != null && obj2 != null){
         String s_date = (String)obj;
         String s_str1 = s_date.substring(0, 4);
         String s_str2 = s_date.substring(4, 6);
         String s_str3 = s_date.substring(6);
         startdate = s_str1+"-"+s_str2+"-"+s_str3;
         
         String e_date = (String)obj2;
         String e_str1 = e_date.substring(0, 4);
         String e_str2 = e_date.substring(4, 6);
         String e_str3 = e_date.substring(6);
         enddate = e_str1+"-"+e_str2+"-"+e_str3;     
         
         
      }else{        
      //오늘 날짜
      Date today = new Date();
      SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
      enddate = date.format(today);
      
      //한달 전
      Calendar mon = Calendar.getInstance();
      mon.add(Calendar.MONTH, -1);
      startdate = new SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
      }
      
   
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
   .searchArea li dl dt {
         display: inline-block;
         font-size: 13px;
   }
   .searchArea li dl dd {
         display: inline-block; 
         margin-right: 30px;
         font-size: 13px;
   }
   .searchArea{
         padding: 15px 0;
         margin-bottom:  50px;
         background-color: #F8E6E0;
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
                                         
                                         「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이<br />
                    보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.<br />
                    공고 중인 동물 소유자는 해당 시군구 및 동물보호센터에 문의하시어 동물을 찾아가시기 바랍니다.<br />
                    다만, 「동물보호법」 제19조 및 동법 시행규칙 제21조에 따라 소유자에게 보호비용이 청구될 수 있습니다.<br /> 
                    또한 「동물보호법」 제17조에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 <br />
                                         「유실물법」 제12조 및 「민법」 제253조의 규정에도 불구하고 해당 시·도지사 또는 시장·군수·구청장이 그 동물의 소유권을 취득하게 됩니다. 
             </p>
      </div>
      
      <div class="searchArea">
         <ul class="searchList">
                        <li>
                            <dl>
                                <dt><label for="searchSDate">날짜</label></dt>
                                <dd>
                               
                                    <input type="date" name="searchSDate" id="searchSDate" class="inputDate" title="시작일"  onblur="$('.calendar').hide();" maxlength=10 value="<%=startdate%>"/> ~ <input type="date" name="searchEDate" id="searchEDate" title="마감일" class="inputDate"  onblur="$('.calendar').hide();" maxlength=10  value="<%=enddate%>"/>
                                    (날짜는 접수일 기준입니다)
                                </dd>
                            </dl>
                        </li>
                        <li>
                            <dl>
                               <dt><label for="searchUprCd">시도</label></dt>
                               <dd>
                                   <select name="searchUprCd" id="searchUprCd" onchange="sigungu()">
                                       <option value="">전체</option>
                                           <option value="6110000">서울특별시 </option>                                           
                                           <option value="6260000">부산광역시 </option>                                          
                                           <option value="6270000">대구광역시 </option>                                           
                                           <option value="6280000">인천광역시 </option>                                           
                                           <option value="6290000">광주광역시 </option>                                           
                                           <option value="5690000">세종특별자치시 </option>                                           
                                           <option value="6300000">대전광역시 </option>                                           
                                           <option value="6310000">울산광역시 </option>                                           
                                           <option value="6410000">경기도 </option>                                           
                                           <option value="6420000">강원도 </option>                                           
                                           <option value="6430000">충청북도 </option>                                           
                                           <option value="6440000">충청남도 </option>                                           
                                           <option value="6450000">전라북도 </option>                                           
                                           <option value="6460000">전라남도 </option>                                           
                                           <option value="6470000">경상북도 </option>                                           
                                           <option value="6480000">경상남도 </option>                                           
                                           <option value="6500000">제주특별자치도 </option>                                                                               
                                   </select>
                             </dd>
                                <dt><label for="searchOrgCd">시군구</label></dt>
                                <dd>
                                   <select name="searchOrgCd" id="searchOrgCd">
                                      <option value="">전체</option>
                           </select>   
                                </dd>
                             <dd style="margin-right: 20px">
                                <button type="button" value="조회" onclick="searchDate()" id="btn">조회</button>
                             </dd>
                         </dl>
                        </li>
             </ul>
      </div>
      
      <h1>총 ${rowTotal }건</h1>
      
      
      <div class="row">
           <c:forEach var="vo" items="${ar }">
        <div class="col-xs-18 col-sm-6 col-md-3" style= "height: 530px;">
          <div class="thumbnail">
            <img src="${vo.popfile }" style= " width:450px; height: 250px;"/>
              <div class="caption">
                <table class="t1">
                   <tbody>
                      <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             공고번호
                            </td>
                          <td align="center" bgcolor="#EFFBEF" > 
                             ${vo.noticeNo}
                          </td>
                       </tr>
                          <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             접수일자
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.happenDt}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             품종
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.kindCd}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             성별
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.sexCd}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             발견장소
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.happenPlace}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             특징
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.specialMark }
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#F8E0F7" width="70">
                             상태
                            </td>
                          <td align="center" bgcolor="#EFFBEF" >
                             ${vo.processState }
                          </td>   
                       </tr>
                      
                   </tbody>
                   
                      <p><a href="view.inc?desertionNo=${vo.desertionNo }&nowPage=${nowPage}&careNm=${vo.careNm}&careTel=${vo.careTel}" class="btn btn-info btn-xs" role="button" style="color: white;">자세히보기</a></p>
           
                </table>
            </div>
          </div>
        </div>
      </c:forEach>
      
       <table style="margin: 0 auto;">
                 <tr>
                    <td>
                       ${pageCode }<br/><br/><br/><br/><br/>
                    </td> 
                 </tr>
         </table>
         
       
       <form name="frm" method="post">
         <input type="hidden" name="startdate" id="s_date"/>
         <input type="hidden" name="enddate" id="e_date"/>
         <input type="hidden" name="uprcd" id="u_city"/>
         <input type="hidden" name="orgcd" id="o_city"/>
         </form>

       
      </div><!-- End row -->
      
    </div><!-- End container -->
   
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   
   <script type="text/javascript">
   function searchDate(){
      /*
      //유효성 검사...
      if($("#searchSDate").val().length < 1 || $("#searchEDate").val().length < 1) {
         alert("날짜를 선택하세요")
         
         return;
      }   
      if($("#searchUprCd").val().length < 1) {
         alert("지역을 선택하세요")
         
         return;
      }   
      */
         $("#s_date").val($("#searchSDate").val());
         $("#e_date").val($("#searchEDate").val());
         $("#u_city").val($("#searchUprCd").val());
         $("#o_city").val($("#searchOrgCd").val());
         document.frm.action = "list.inc";
         document.frm.submit();
      
      
      
      
      
      
   }
   
   function sigungu(){
      var uprcd = $("#searchUprCd").val();
      var param = "uprcd="+encodeURIComponent(uprcd);
      
      $.ajax({
         url : "sigungu.inc",
         data : param,
         type: "post",
         dataType : "json"
      }).done(function(data){
         if(data.ar != undefined){
            var code = "<option value=''>전체</option>";
            for(var i=0; i<data.ar.length; i++){
               code += "<option value='";
               code += data.ar[i].orgCd;
               code += "'>";
               code += data.ar[i].orgdownNm;
               code += "</option>"; 
            }
            $("#searchOrgCd").html(code);
         }
         
      }).fail(function(err){
         console.log(err);
      });
      
   }
   </script>


</body>
</html>
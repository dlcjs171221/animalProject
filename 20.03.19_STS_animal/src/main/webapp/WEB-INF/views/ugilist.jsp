<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<style type="text/css">
   .t_1{
      width: 1100px;
  	  margin: 0 auto;
  	  text-align: center;
   }
   .t_2{
      width: 500px;
      display: inline-block;
      border: 3px solid black;
   }
   .t1{
      width : 490px;
      border: 1px solid red;
   }
   tbody td{
      border: 1px solid blue;
   }
    .searchArea ul{
   	
   }
   .searchArea li{
   	 
   	  
   }
   .searchArea li dl{
   	  
   }
   .searchArea li dl dt {
   		display: inline-block;
   }
   .searchArea li dl dd {
   		display: inline-block;
   }
   #main {
   		text-align: right;   		
   		margin: 0 auto;
   		padding: 10px;
   }
  #tb{
  	text-align: center;
  	margin: 0 auto; 
  }
  
 
  
  
</style>
</head>
<body>
	
   <div id="div1">
   
      <div>
          <p>
                                         
                                         
					여기는 동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.<br />
                    동물을 분실한 경우 동물보호법 제12조제1항 및 같은 법 시행규칙 제8조제1항 및 제9조제2항에 따라 등록대상동물을<br />
                    10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.(다만, 동물보호관리시스템에서 소유자가 직접 동물상태 수정 가능)<br />
                    로그인 후 분실신고를 등록할 수 있습니다.<br />            
          </p>
      </div>
      
      <div class="searchArea">
         <ul class="searchList">
                        <li>
                            <dl>
                               <dt><label for="searchUprCd">시도</label></dt>
                               <dd>
                                   <select name="searchUprCd" id="searchUprCd">
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
                             <dd>
                                <button type="button" value="조회" onclick="searchDate()">조회</button>
                             </dd>
                         </dl>
                        </li>
             </ul>
      </div>
      
        
      <div class="boardList">
            
            <ul class="list"><li>총 ${rowTotal } 건</li></ul>
            
      </div>
      
      <div class="t_1">
             
             
                <c:forEach var="vo" items="${ugilist }" varStatus="st">
              <div class="t_2">
                 <!-- LIST -->
                
                 <table class="t1">
                    <tbody>
                       <tr>
                         
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             공고번호
                            </td>
                          <td>
                             <!-- 공고번호 -->   
                             ${rowTotal-((nowPage-1)*blockList+st.index) }	
                          </td>
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             접수일자
                            </td>
                          <td>
                             <!-- 접수일자 -->
                             ${fn:substring(vo.write_date,0,10) }
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="50">
                             품종
                            </td>
                          <td>
                             <!-- 품종 -->
                             ${vo.kind}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             작성자
                            </td>
                          <td>
                             <!-- 작성자 -->
                             ${vo.writer}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             제목
                            </td>
                          <td>
                             <!-- 제목 -->
                             ${vo.subject}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             조회수
                            </td>
                          <td>
                             <!-- 조회수 -->
                             ${vo.hit}
                          </td>   
                       </tr>
                       <tr >
                          <td id="view_t" rowspan="1"  >
                             <!-- 자세히보기 -->
                             <input type="button" value="자세히보기" onclick="javascript:location.href='ugiview.inc?b_idx=${vo.b_idx}&nowPage=${nowPage }'"/>
                          </td>
                       </tr>
                     </tbody>
                  </table>
	                  
	         </div>
	         </c:forEach>
	         
	         <table id="tb">
	         		<tfoot>
	                 <tr>
                    <td>
	                       ${pageCode }
	                    </td>
	                 </tr>
	                 </tfoot>
	           </table>
	          <div id="main">
	          		<input type="button" value="등록하기" onclick="javascript:location.href='ugiwrite.inc?bname=유기'"/>
	          		&nbsp;&nbsp;
	               <input type="button" value="메인으로 가기" onclick="javascript:location.href='main.inc'"/>
	          </div>
         
      	</div>
   </div>
   
   <form name="frm" method="post">
   		<input type="hidden" name="startdate" id="s_date"/>
   		<input type="hidden" name="enddate" id="e_date"/>
   		<input type="hidden" name="uprcd" id="u_city"/>
   </form>
   
<script src="resources/js/jquery-3.4.1.min.js"></script> 
<script type="text/javascript">
	function searchDate(){
		
		//유효성 검사...
		if($("#searchSDate").val().length < 1 || $("#searchEDate").val().length < 1) {
			alert("날짜를 선택하세요")
			
			return;
		}	
		if($("#searchUprCd").val().length < 1) {
			alert("지역을 선택하세요")
			
			return;
		}	
		
		//모든 조건을 선택하였을 때
		if($("#searchSDate").val().length > 0 && $("#searchEDate").val().length > 0 && $("#searchUprCd").val().length > 0){
		$("#s_date").val($("#searchSDate").val());
		$("#e_date").val($("#searchEDate").val());
		$("#u_city").val($("#searchUprCd").val());
		document.frm.action = "list.inc";
		document.frm.submit();
		}
		
	}
</script>
</body>
</html>
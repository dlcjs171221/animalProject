<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/text.css" rel="stylesheet" type="text/css">
<style type="text/css">
   .t_1{
      width: 1100px;
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
   td{
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
</style>
</head>
<body>
   <div>
   
      <div>
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
                                    <input type="date" name="searchSDate" id="searchSDate" class="inputDate" title="시작일"  onblur="$('.calendar').hide();" maxlength=10/> ~ <input type="date" name="searchEDate" id="searchEDate" title="마감일" class="inputDate"  onblur="$('.calendar').hide();" maxlength=10/>
                                    (날짜는 접수일 기준입니다)
                                </dd>
                            </dl>
                        </li>
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
      
      <!-- 유의사항 -->
        <div class="note-txt">
            <ul>
                <li> 검색시 유의사항 : 날짜와 지역을 모두 선택하여야 검색이 가능합니다.</li>
                <li>
                    <span class="red regular"> 공고중인 동물 소유자는 "자세히 보기"를 참고하시어 해당 </span><span class="blue">시군구</span><span style="color:#8c0000;"> 및 </span>
                    <span style="color:blue;">동물보호센터</span><span style="color:#8c0000;"> 또는 <br/></span>
                    <span style="color:blue;">동물보호상담센터 1577-0954</span>로 문의하시기 바랍니다.
                </li>
                <li>
                        동물보호센터 및 동물병원 <span class="red regular">근무시간은 09:00 ~ 18:00이므로 문의전화는 근무시간에만 가능</span>합니다.
                </li>
           </ul>
        </div>
          <div class="boardList">
                
                <ul class="list"><li>총 ${rowTotal } 건</li></ul>
                
          </div>
             <div class="t_1">
             
             
                <c:forEach var="vo" items="${ar }">
              <div class="t_2">
                 <!-- LIST -->
                
                 <table class="t1">
                    <tbody>
                       <tr>
                          <td rowspan="5" width="60" height="60" class="img_td">
                             <!-- 사진 -->
                             <img src="${vo.popfile }" width="100%" height="100%"/>
                          </td>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             공고번호
                            </td>
                          <td>
                             <!-- 공고번호 -->   
                             ${vo.noticeNo}
                          </td>
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             접수일자
                            </td>
                          <td>
                             <!-- 접수일자 -->
                             ${vo.happenDt}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="50">
                             품종
                            </td>
                          <td>
                             <!-- 품종 -->
                             ${vo.kindCd}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             성별
                            </td>
                          <td>
                             <!-- 성별 -->
                             ${vo.sexCd}
                          </td>   
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             발견장소
                            </td>
                          <td>
                             <!-- 발견장소 -->
                             ${vo.happenPlace}
                          </td>   
                       </tr>
                       <tr>
                          <td rowspan="2">
                             <!-- 자세히보기 -->
                             <input type="button" value="자세히보기" onclick="javascript:location.href='view.inc?desertionNo=${vo.desertionNo}&nowPage=${nowPage }'"/>
                          </td>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             특징
                            </td>
                          <td>
                             <!-- 특징 -->
                             ${vo.specialMark }
                          </td>
                       </tr>
                       <tr>
                          <td height="20" align="center" bgcolor="#669AB3" width="70">
                             상태
                            </td>
                          <td>
                             <!-- 상태 -->
                             ${vo.processState }
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  
         </div>
         </c:forEach>
         
         <table>
                 <tr>
                    <td>
                       ${pageCode }
                    </td>
                 </tr>
           </table>
         
         
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   <!-- 날짜 사용시 사용(substring) -->
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/text.css" rel="stylesheet" type="text/css">

</head>
<body topmargin=0 leftmargin=0 marginwidth="0" marginheight="0"> 

<!--주요내용시작 -->
<form name="ff2" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
  		  <tr>
		<td valign="top">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  
			<tr>
			  <td align="center" height="10"></td>
			</tr>
			<tr>
			  <td align="center"><u><b>보호센터 목록</b><u></td>
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
					<td bgcolor="#E5E5E5">
					<table width="100%" border="0" cellspacing="1" cellpadding="2">
						<tr>
						  <td height="20" align="center" bgcolor="#669AB3" width="100"><font color="#FFFFFF">관할구역</font></td>
						  <td height="20" align="center" bgcolor="#669AB3" width="100"><font color="#FFFFFF">보호센터명</font></td>
						  <td height="20" align="center" bgcolor="#669AB3" width="80"><font color="#FFFFFF">전화번호</font></td>
						  <td height="20" align="center" bgcolor="#669AB3" width="230"><font color="#FFFFFF">보호센터주소</font></td>
						</tr>
						
		   		<c:forEach var="vo" items="${list }" varStatus="st"> <!-- Action에서 넘어온 list를 items에 써준다 -->
						<tr>
						 <td bgcolor="#F2F7F9">
								${vo.s_area }
						  </td>
						  <td bgcolor="#F2F7F9" style="text-align:left">
								${vo.s_name }
						  </td>
						  <td bgcolor="#F2F7F9">${vo.s_tel }</td>
						  <td bgcolor="#F2F7F9">${vo.s_addr }</td>

						</tr>
		   		</c:forEach>		
		   		<c:if test="${empty list }">
					<tr>
					  <td bgcolor="#F2F7F9" colspan="5" height="70" align="center">등록된 게시물이 없습니다.</td>
					</tr>
				</c:if>
					  </table></td>
					  
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
							  		${pageCode }
						  		</td>
						  <td width="241" align="right">
						  	<input type="button" value="메인으로 가기" onclick="javascript:location.href='main.inc'" />
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



<form name="frm" method="post">
	<input type="hidden" name="nowPage" value="${nowPage }"/>
	<input type="hidden" name="seq"/>
</form>

</body>
</html>
    
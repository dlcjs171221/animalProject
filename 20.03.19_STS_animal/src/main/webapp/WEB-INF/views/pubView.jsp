<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div>
		<table id="t1">
			<thead>
				<tr>
					<td colspan="2">제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						${vo.subject }
					</td>
					<td>
						${vo.write_date }
					</td>
					<td>
						${vo.hit }
					</td>
				</tr>
				<tr>
					<td colspan="4">
						${vo.content }
					</td>
				</tr>
				<tr>
					<td>
						첨부파일
					</td>
					<td colspan="3">
					
					<c:if test="${vo.file_name != null and fn:length(vo.file_name) > 4}">
						<a href="javascript:fDown('${vo.file_name }')">	
							${vo.file_name }
						</a>
					</c:if>
					</td>
				</tr>
				
				<!-- m_id가 master일 때만 수행하는 수정기능 -->
				<tr>
					<td colspan="4">
						<input type="button" value="수정" onclick="javascript:location.href='bbsedit.inc?b_idx=${vo.b_idx}&nowPage=${param.nowPage }'"/>
					</td>
				</tr>
				
			</tbody>
		</table>
		<form name="frm" method="post">
			<input type="hidden" name="f_name" />
			<input type="hidden" name="b_idx" value="${param.b_idx }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<!-- bname추가함 -->
			<input type="hidden" name="bname" value="${param.bname }">
		</form>
	</div>
	
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
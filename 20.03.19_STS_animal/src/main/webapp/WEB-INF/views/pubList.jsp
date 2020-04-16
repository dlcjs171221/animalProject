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
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/shop-homepage.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
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
</style>
</head>
<body>


<div id="include_header"></div>


	<div class="boardList">          
          <ul class="list"><li>총 ${rowTotal } 건</li></ul>          
    </div>
	<div class="t_1">	
		<table class="t1">
			<thead>
	            <tr>
	                <td>번호</td>
	                <td style="width: 50%;">제목</td>
	                <td>작성일</td>              
	                <td>조회수</td>                
	            </tr>
	        </thead>	        
	        <tbody>	
	        	<c:forEach var="vo" items="${pubList}" varStatus="st">
	        	<tr>
	        		<td>
	        		<!-- 번호
					전체게시물수-((현재페이지-1)*한페이지당 보여질 게시물 수+인덱스)
                    --> 
	        		${rowTotal-((nowPage-1)*blockList+st.index) }
	        		<!-- 작은수부터 찍을 때는 st.index -->
	        		</td>
	        		<td>
	        		<!-- 제목 (get 요청에 bname추가함)-->
	        		<a href="pubview.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}&bname=${vo.bname}">
	        			${vo.subject }
	        		</a>
	        		</td>
	        		<td>
	        		<!-- 작성일 -->
	        		${fn:substring(vo.write_date,0,10) }
	        		</td>
	        		<td>
	        		<!-- 조회수 -->
	        		${vo.hit }
	        		</td>
	        	</tr>
	        	</c:forEach>        	
	        </tbody>
	        <tfoot>
	        	<tr>
	        		<td colspan="3">
	        			${pubPageCode }
	        		</td>
	        		<td>
	        			<button type="button" name="pubwrite" value="정책쓰기" onclick="javascript:location.href='infowrite.inc?bname=정책'">정책쓰기</button>
	        		</td>
	        	</tr>
	        	
	        </tfoot>	
		</table>
	</div>
	
	<!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
   <script src="vendor/js/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- 아코디언 스크립트 -->
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script src="resources/js/jquery-ui.min.js"></script>
   <script>
  $(function(){
	$("#include_header").load("header.inc");
  });
  
  </script>
   
</body>
</html>
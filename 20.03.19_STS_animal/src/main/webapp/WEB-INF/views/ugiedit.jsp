<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css"/>

 <link href="resources/css/text.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">
	
<script type="text/javascript">
	function check(ff){
		
		
		
		//유효성 검사
		if($("#subject").val().length < 1) {
		alert("제목을 입력하세요")
		$("#subject").focus()
		return;
		}
		if($("#content").val().length < 1) {
			alert("내용을 입력하세요")
			$("#content").focus()
			return;
		}
		if($("#kind").val().length < 1) {
			alert("품종을 입력하세요")
			$("#kind").focus()
			return;
		}
		if($("#email").val().length < 1) {
			alert("이메일을 입력하세요")
			$("#email").focus()
			return;
		}
		if($("#phone").val().length < 1) {
			alert("연락 가능한 번호를 입력하세요")
			$("#phone").focus()
			return;
		}
		if($("#lose_date").val().length < 1) {
			alert("잃어버린 날짜를 입력하세요")
			$("#lose_date").focus()
			return;
		}
	
		
		var queryString = $("form[name=frm]").serialize();
	
		
		$.ajax({
			url : "ugiedit.inc",
			data : queryString,
			type : "post",
			dataType : "json" 
		}).done(function(data){
			if(data.value){
				alert("수정되었습니다");
				location.href="ugiview.inc?b_idx=${vo.b_idx}&nowPage=${nowPage}";
			}
			
		}).fail(function(err){
			
		});
	}
</script>
</head>
<body>
	
	<div id = "write">
	<form name="frm"
	enctype="multipart/form-data">
	<input type="hidden" name="b_idx" value="${vo.b_idx }"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="asd1">
  <tr>
    <td valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="asd2">
        <tr>
          <td align="center" height="10"></td>
        </tr>
        <tr>
          <td align="center"><u><b>분실신고 수정하기</b></u></td>
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
                <td bgcolor="#E5E5E5"><table width="100%" border="0" cellspacing="1" cellpadding="2">

                    <tr>
                      <td width="90" height="20" align="center" bgcolor="#F8E0F7">작성자</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" name="writer" value="${mvo.m_name }" readonly cssStyle="width:100px" theme="simple"/></td>
                    </tr>

                    <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">제목</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" id="subject" name="subject" value="${vo.subject }" size="50" theme="simple"/></td>
                    </tr>
                    
                      
                     <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">내용</td>
                      <td bgcolor="#EFFBEF" align="left"> <textarea id="content" name="content" cols="50" rows="10" theme="simple" >${vo.content }</textarea></td>
                    </tr>
                    
                    
                    <tr>
                    
                      <td height="20" align="center" bgcolor="#F8E0F7">첨부파일</td>
                      <td bgcolor="#F2F7F9" align="left">
                        <input type="file" name="file" cssStyle="width:300px" theme="simple"/>
                        (${vo.file_name })
                      </td>
                    </tr>
                     <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">품종</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" id="kind" name="kind" value="${vo.kind }" size="50" theme="simple"/></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">이메일</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" id="email" name="email" value="${vo.email }" size="50" theme="simple"/></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">전화번호</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" id="phone" name="phone" value="${vo.phone }" size="50" theme="simple"/></td>
                    </tr>
                    <tr>
                      <td height="20" align="center" bgcolor="#F8E0F7">잃어버린<br/>날짜</td>
                      <td bgcolor="#EFFBEF" align="left"> <input type="text" id="lose_date" name="lose_date" value="${vo.lose_date }" size="50" theme="simple"/></td>
                    </tr>
                    
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
                      <td width="315" align="center">
          
                      </td>
		              	 <td width="241" align="right">
		                      <input type="button" class="btn btn-info btn-xs" role="button" style="color: white;" onclick="javascript:location.href='bbslist.inc?bname=${vo.bname}&nowPage=${nowPage }'" value="목록"/>
		                      <input type="button" class="btn btn-info btn-xs" role="button" style="color: white;"  onclick="check(this.form)" value="저장"/>
		                      <input type="reset"  class="btn btn-info btn-xs" style="color: white;" value="재입력"/>
	                      </td>
                    </tr>
                  	</table>
                </td> 
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="19"></td>
        </tr>
      </table>
    </td>
  </tr>
	</table>
	</form>
		<!--  
		<table width="556" border="0" cellspacing="0" cellpadding="0" id="table1">
				<tr>
                    <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">내용</font></td>
                    <td bgcolor="#F2F7F9" align="left"> <textarea name="content" cols="50" rows="10" theme="simple"></textarea></td>
               </tr>
              	
				<tr>
					<td width="241" align="right" colspan="2">
	                      <input type="button" onclick="javascript:location.href='ugilist.inc?bname=${bname}'" value="목록"/>
	                      <input type="button" onclick="check(this.form)" value="저장"/>
	                      <input type="reset" value="재입력"/>
	                 </td>
				</tr>
		</table>
		-->
		
	</div>
	
   <script src="resources/js/jquery-ui.min.js"></script>   
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   
<script src="resources/js/summernote-lite.js"></script>
<script src="resources/js/lang/summernote-ko-KR.min.js"></script>	
<script type="text/javascript">
$(function(){
	
	$("#content").summernote({	
			height : 300,
			width : 450,
			lang : "ko-KR",
			callbacks:{ //특정한 사건이 발생했을 때 자동으로 롤백 해주는 역할
				onImageUpload: function(files, editor){
					//이미지가 에디터에 추가될 때마다 수행하는 곳
					//console.log("TTTTTT");
					//이미지를 첨부하면 배열로 인식된다.
					//이것을 서버로 비동식 통신을 수행하는 함수를 호출하여
					//upload를 시킨다.
					for(var i=0; i<files.length; i++){
						sendFile(files[i], editor);
					}
				},
			}
		});
		
		$("#content").summernote("lineHeight", 1.0);
		
		$("#content").summernote({
			placeholder : "ddd"
		});
		
		$("#subject").focus();
	
	});
	
	
	

	function sendFile(file, editor){
		//이미지를 서버로 업로드 시키기 위해
		//비동기식 통신을 수행하자!
		
		//파라미터를 전달하기 위해 폼객체 준비!
		var frm = new FormData(); //<form encType="multipart/formData"></form>
		
		//보내고자 하는 자원을 파라미터 값으로 등록(추가)
		frm.append("file", file);
		
		
		//비동기식 통신
		$.ajax({
			url: "saveImage.inc",
			type: "post",
			dataType: "json",
			//파일을 보낼 때는 일반적인 데이터 전송이 아님을 증명해야 한다.
			contentType: false,
			processData: false,
			//data:"v1="+encodeURIComponent(값)
			data: frm  //upload와 str이 담겨져 보내진다.
		}).done(function(data){
			console.log("안녕");
			//console.log(data.img_url);
			//에디터에 img태그로 저장하기 위해
			//img태그 만들고, src라는 속성을 지정해야 함!
			//var img = $("<img>").attr("src",data.img_url);
			
			//$("#content").summernote("insertNode", img[0]);
			//console.log(data.str);
			
			$("#content").summernote("editor.insertImage", data.url);
			
		}).fail(function(err){
			console.log(err);
		});
	}	
	
	 $(function(){
			$("#include_header").load("header.inc");
		  });
</script>
	
</body>
</html>













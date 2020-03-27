<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="UTF-8"> 
<style type="text/css">

	body{ /* body를 화면 가장자리로 보낸다. */
		padding: 0;
		margin: 0;
	}
	
	div#header{  /* div(범위)를 화면 가장자리로 보낸다. */
		height: 44px;
		margin: 0;
		color: #fff;
		background-color: white;
	}
	
	ul#menu{
		margin: 0;
		padding: 0;
		list-style: none;
		font: 15px sans-serif;
		line-height: 44px;
		text-align: center;
	}
	
	ul#menu>li{
		display: inline-block;
		width: 125px;
	}
	
	ul#menu>li>a{
		color: black;
		text-decoration: none;
	}
	
	ul#menu>li>a:hover {
		color: black;
		font-size: 16px;
		font-weight: bold;
	}
	
	#bar_up{
		margin: 3px;
		padding-top: 20px;
		padding-left: 450px;
	}
	
	#demo{
		display: inline-block;
		width: 600px;
		margin-top: 50px;
		margin-left: 450px;
	}
	
	#right{
		display: inline-block;
		width: 400px;
		height: 500px;
		margin-top : 100px;
		margin-left: 70px;
	}
	
	#t2{
		width: 300px;
		height: 200px;
		background-color: #efefef;
	}
	
	#t3{
		margin-top: 30px;
		width: 310px;
		height: 300px;
		background-color: #efefef;
	}
	#btn{
	}
	#m_btn{
		text-align: right;
	}
	
	#pp{
		font-size: 16px;
		color: #111;
		font-family: cursive;
		width: 100%;
		
	}
	#all{
		width: 1100px;
		height: 450px;
		border: 1px solid black;
		margin-left: 400px;
	}
	#sidebar{
		display: inline-block;
		border: 1px solid black;
		width: 200px;
		height: 200px;
		margin-top: 40px;
	}
	.contents{
		display: inline-block;
		border: 1px solid black;
		width: 700px;
		height: 300px;
		padding-left: 50px;
		margin-left: 50px;
	}
</style>
</head>
<body>
	
	<!-- 메뉴바 작업 -->
	<div id="header">
		<ul id="menu">
			<li><a href="javascript:location.href='list.inc'">유기동물</a></li>
			<li><a href="">동물등록</a></li>
			<li><a href="">농장동물</a></li>
			<li><a href="">TNR</a></li>
			<li><a href="">정보마당</a></li>
			<li><a href="">업체정보</a></li>
			<li><a href="javascript:location.href='pubData.inc'">정책정보</a></li>
		</ul>
	</div>
	
	<!-- 상단 이미지 작업 -->
	<div id="bar_up">
		<img src="resources/images/bar_up.JPG"/>
	</div>
	
	<div id="all">
	
	<!-- sideBar -->	
	<div id="sidebar">
		<h2 id="left_title"></h2>
		<ul>
			<li>
				<a href="">이용안내</a>
			</li>
			<li>
				<a href="javascript:location.href='reg.inc'">회원가입</a>
			</li>
			<li>
				<a href="">개인정보처리방침</a>
			</li>
		</ul>	
	</div>
	
	
	<!-- 로그인창 -->
    <div class="contents">
		<h1 class="login-title">로그인</h1>
		
		<!-- login-box -->
       	<div class="login-box">
			<form action="" method="post">
	            <table class="login-box-table1">
                	<caption>개인로그인</caption>
                	<colgroup>
                		<col width="80px" />
                		<col width="*" />
                	</colgroup>
                       <tbody>
                       	<tr>
                        	<td class="login_t">
                            	<div class="row">
                                	<input class="input-id" name="id" id="id" type="text" placeholder="아이디" value="">
									<span class="login-check-text" id="idErr" style="display:none;">아이디를 입력해주세요.</span>
         						</div>
					         	<div class="row">
					            	<input type="password" name="pw" id="pw" placeholder="비밀번호" 
					            		maxlength="16" onkeydown="if(event.keyCode==13){login.submit();}" autocomplete="off">
					             	<span class="login-check-text non-pb" id="pwdErr" style="display:none;">비밀번호를 입력해주세요.</span>
					         	</div>
					         	<div class="row">
					            	<button class="btn btn-f btn-point login-top" id="login_btn" type="button"
					            			onclick="sendData(this.button)" >Login</button>
					            	<!-- 
					            	<button class="btn btn-f btn-point login-top" id="reg_btn" type="button"
					            		onclick="reg()" >Registry</button>
					            	-->
					            </div>
					            <div>
					            	<a href="${url }"><img src="resources/images/naver.PNG" width="150"></a>
					            </div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>	
		</div>				
	</div>

	</div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	function sendData(frm) {
		
		//사용자가 입력한 id pw값
		var m_id = $("#id").val().trim();
		var m_pw = $("#pw").val().trim();
		
		if(m_id.length < 1){
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;
		}
		
		if(m_pw.length < 1){
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
		frm.submit();
	}
</script>
</body>
</html>


























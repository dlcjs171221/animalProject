<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href= "resources/css/loginCss.css" rel="stylesheet" id="bootstrap-css"/>
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">

<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>

<div class="cotn_principal">
	<div class="cont_centrar">

		<div class="cont_login">
			<div class="cont_info_log_sign_up">
				<div class="col_md_login">
					<div class="cont_ba_opcitiy">

						<h2>로그인</h2>
						<p></p>
						<button class="btn_login" onclick="cambiar_login()">로그인</button> <!-- 처음 접속했을때 나오는 로그인 버튼 -->
					</div>
				</div>
				<div class="col_md_sign_up">
					<div class="cont_ba_opcitiy">
						<h2>회원가입</h2>


						<p></p>

						<button class="btn_sign_up" onclick="cambiar_sign_up()">회원가입</button><!-- 처음 접속했을때 나오는 회원가입 버튼 -->
					</div>
				</div>
			</div>


			<div class="cont_back_info">
				<div class="cont_img_back_grey">
					<img
						src="https://www.gtagangwars.de/suite/images/styleLogo-6bd77433ddf78bd8477ea7306e804f677bc925d0.png"
						alt="" />
				</div>

			</div>
			<div class="cont_forms">
				<div class="cont_img_back_">
					<img
						src="https://www.gtagangwars.de/suite/images/styleLogo-6bd77433ddf78bd8477ea7306e804f677bc925d0.png"
						alt="" />
				</div>
				<div class="cont_form_login">
					<a href="#" onclick="ocultar_login_sign_up()"></a>
		
						<h2>로그인</h2>
						<input type="text"  name="m_id" id="l_id" placeholder="아이디" />
						<input type="password" name="m_pw" maxlength="16" id="l_pw" onkeydown="if(event.keyCode==13){login.submit();}" placeholder="비밀번호" />
						<button class="btn_login" onclick="cambiar_login()" id="login">로그인</button><!-- 처음 로그인버튼을 누른뒤 나오는 로그인버튼 -->
						<div class="naver">
	                       <a href="${url }">
	                       	<img src="resources/images/naver.PNG" width="200" height="38">
	                       </a>
	                    </div>

				</div>

				<div class="cont_form_sign_up">
					
					
					
	
					<h2>회원가입</h2>
					
					
					<input type="text" id="r_id" name="m_id" placeholder="아이디" /> 
					<input	type="password" name="m_pw" placeholder="비밀번호를 입력하세요" id="r_pw"/> 
					<input type="text" id="r_name" name="m_name" placeholder="이름"  /> 
					<input type="text" id="email1" name="s_email" placeholder="이메일"/> 
					<label for="email2">@</label>
					<input type="text" id="email2" name="s_email" placeholder="ex) naver.com"/>&nbsp;&nbsp;&nbsp;
					
					<select name="s_phone" id="phone">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="017">017</option>
                    </select>
					<label for="phone2">-</label> 
					<input type="text" id="phone2" name="s_phone" /> 
					<label for="phone3">-</label> 
					<input type="text" id="phone3" name="s_phone" />
					
					
					<button class="btn_sign_up"  id="reg" onclick="cambiar_sign_up()">회원가입</button><!-- 처음 회원가입버튼을 누른뒤 나오는 회원가입버튼 -->
	
				</div>

			</div>

		</div>
	</div>
</div>

<form action="login.inc" name="frm1" method="post">
	<input type="hidden" name="m_id"  id="L_id"/>
   	<input type="hidden" name="m_pw"  id="L_pw"/>
</form>

<form action="reg.inc" name="frm2" method="post">
	<input type="hidden" name="m_id"  id="R_id"/>
   	<input type="hidden" name="m_pw"  id="R_pw"/>
   	<input type="hidden" name="m_name"  id="R_name"/>
   	<input type="hidden" name="s_email"  id="R_email"/>
   	<input type="hidden" name="s_phone"  id="R_phone"/>
</form>




<script>
	/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
	---------------------------------------
	 */

	function cambiar_login() {
		document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
		document.querySelector('.cont_form_login').style.display = "block";
		document.querySelector('.cont_form_sign_up').style.opacity = "0";
<!-- 
		setTimeout(function() {
			document.querySelector('.cont_form_login').style.opacity = "1";
		}, 400);
-->
		setTimeout(
				function() {
					document.querySelector('.cont_form_sign_up').style.display = "none";
				}, 200);
		
	}

	function cambiar_sign_up(at) {
		document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
		document.querySelector('.cont_form_sign_up').style.display = "block";
		document.querySelector('.cont_form_login').style.opacity = "0";

		setTimeout(function() {
			document.querySelector('.cont_form_sign_up').style.opacity = "1";
		}, 100);

		setTimeout(function() {
			document.querySelector('.cont_form_login').style.display = "none";
		}, 400);

	}

	function ocultar_login_sign_up() {

		document.querySelector('.cont_forms').className = "cont_forms";
		document.querySelector('.cont_form_sign_up').style.opacity = "0";
		document.querySelector('.cont_form_login').style.opacity = "0";

		setTimeout(
				function() {
					document.querySelector('.cont_form_sign_up').style.display = "none";
					document.querySelector('.cont_form_login').style.display = "none";
				}, 500);

	}
	
	
	
	
	
	$("#login").bind("click",function(){
		
		$("#L_id").val($("#l_id").val());
		$("#L_pw").val($("#l_pw").val());

		var obj1 = $("#l_id").val();
		var obj2 = $("#l_pw").val();
		
		if( obj1 == 0  ){
			 alert("아이디를 입력해주세요");
			 $("#l_id").focus();
			 return;
		}else if( obj2 == 0  ){
			alert("패스워드를 입력해주세요");
			$("#l_pw").focus();
			 return;
		}
		
		document.frm1.submit();
		
	});
	
	$("#reg").bind("click",function(){
		
		$("#R_id").val($("#r_id").val());
		$("#R_pw").val($("#r_pw").val());
		$("#R_name").val($("#r_name").val());
		
		$("#R_email").val($("#email1").val());
		$("#R_email").val($("#email2").val());
		
		$("#R_phone").val($("#phone").val());
		$("#R_phone").val($("#phone2").val());
		$("#R_phone").val($("#phone3").val());
		

		var ob1 = $("#r_id").val();
		var ob2 = $("#r_pw").val();
		var ob3 = $("#r_name").val();
		var ob4 = $("#email1").val();
		var ob5 = $("#email2").val();
		var ob6 = $("#phone").val();
		var ob7 = $("#phone2").val();
		var ob8 = $("#phone3").val();
		
		
		if(ob1 == 0 ){
			alert("아이디 또는 패스워드를 입력해주세요");
			$("#r_id").focus();
			 return;
		}else if(ob2 == 0){
			alert("아이디 또는 패스워드를 입력해주세요");
			$("#r_pw").focus();
			 return;		
		}else if(ob3 == 0){
			alert("이름을 입력해주세요");
			$("#r_name").focus();
			 return;
		}else if(ob4 == 0){
			alert("이메일을 입력하세요");
			$("#email1").focus();
			 return;
		}else if(ob5 == 0){
			alert("이메일을 입력하세요");
			$("#email2").focus();
			 return;
		}else if(ob6 == 0){
			alert("전화번호를 입력하세요");
			$("#phone").focus();
			 return;
		}else if(ob7 == 0){
			alert("전화번호를 입력하세요");
			$("#phone2").focus();
			 return;
		}else if(ob8 == 0){
			alert("전화번호를 입력하세요");
			$("#phone3").focus();
			 return;
		}
		
		document.frm2.submit();
		
	});
	
	
	
</script>
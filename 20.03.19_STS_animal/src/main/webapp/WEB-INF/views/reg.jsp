<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Shop Homepage - Start Bootstrap Template</title>




<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/shop-homepage.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">







</head>
<style>
#bar_up {
   margin: 3px;
   padding-top: 20px;
   padding-left: 390px;
}

.contents {
   padding-top: 50px;
   padding-left: 50px;
   border: 1px solid rgb(75, 75, 93); 
   width : 780px;
   height: auto;
   width: 780px;
}

.ul {
   width: 230px;
   border: 3px solid #ccc;
   border-radius: 8px;
   margin: 10px 0 0 10px;
   list-style: none;
}

.ul li {
   padding: 10px 0 0 10px;
   border-top: 1px dotted #ccc;
   margin-bottom: 10px;
}

.ul li:first-child {
   border: 0 none;
}

.ul li a {
   height: 20px;
   line-height: 20px;
   display: block;
   text-decoration: none;
   color: #000;
}

.ul li p {
   color: blue;
}

#t3 {
   margin-top: 30px;
   width: 255px;
   height: 300px;
   background-color: #efefef;
}

#carouselExampleIndicators {
   width: 850px;
}

.carousel-inner {
   width: 800px;
   height: 380px;
   margin-left: 30px;
   padding-left: 50px;
}

.row {
   margin-bottom: 50px;
}



.login-title {
   font-family: inherit;
   font-size: 2.5em;
   text-align: center;
}

.login-box {
   width: 650px;
   height: 300px;
   margin: auto;
}

/* 일반회원 */
.person_login {
   float: left;
   width: 300px;
   margin: 0;
   padding: 5px;
   margin: 0;
}

/* 기업회원 */
.group_login {
   float: right;
   width: 300px;
   margin: 0;
   padding: 10px;
}

#login_per, #login_gro {
   width: 20%
}

.login-box-table1 caption {
   text-indent: -9999px;
}

.login_t {
   width: 550px;
   height: 200px;
}

#id.input-id {
   width: 100%;
   height: 44px;
   margin: 10px;
}

#pw {
   width: 100%;
   height: 44px;
   margin: 10px;
   margin-left: 10px;
}

.btn btn-f btn-point login-top {
   margin: 0;
   padding: 0;
}

#login_btn {
   margin-left: 1.35em;
   padding: 0 .55em;
}

#reg_btn {
   margin-left: .35em;
   padding: 0 .55em;
}
.naver{
   position: relative;
   bottom : 35px;
   margin-bottom: 15px;
   margin-left: 11px;
}

#reg_name{
   padding-bottom: 10px;
}
</style>

<body>

   <!-- 메인 이미지 -->
   <div id="bar_up">
      <img src="resources/images/bar_up.JPG" width="1115">
   </div>







   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="#">검색영역</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active"><a class="nav-link" href="main.inc">Home
                     <span class="sr-only">(current)</span>
               </a></li>
               <li class="nav-item"><a class="nav-link" href="login.inc">로그인</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="reg.inc">회원가입</a></li>
            </ul>
         </div>
      </div>
   </nav>

   <!-- Page Content -->
   <div class="container">
      <div class="row">

         <div class="col-lg-3">

            <h1 class="my-4">
               동물보호<br />관리시스템
            </h1>
            <div class="list-group">

               <a href="login.inc" class="list-group-item">로그인</a> 
               <a href="reg.inc" class="list-group-item">회원가입</a>

            </div>

         </div>
         <!-- /.col-lg-3 -->
         
         <div class="contents">
            <!-- login-box -->
            <form action="reg.inc" method="post">
            <div id="wrap">
               <div id = reg_name>
               <h2>회원가입</h2>
               </div>
               <table>
                  <caption></caption>
                  <colgroup>
                     <col width="100px" />
                     <col width="*" />
                  </colgroup>
                  <tbody>
                     <tr>
                        <th><label for="id">아이디:</label></th>
                        <td><input type="text" id="id" name="m_id" />
                           <div id="box"></div></td>
                     </tr>
                     <tr>
                        <th><label for="pw">비밀번호:</label></th>
                        <td><input type="password" id="pw2" name="m_pw" /></td>
                     </tr>
                     <tr>
                        <th><label for="name">이름:</label></th>
                        <td><input type="text" id="name" name="m_name" /></td>
                     </tr>
                     <tr>
                        <th><label for="email1">이메일:</label></th>
                        <td><input type="text" id="email1" name="s_email" /> <label
                           for="email2">@</label> <input type="text" id="email2"
                           name="s_email" /></td>
                     </tr>
                     <tr>
                        <th><label for="phone">연락처:</label></th>
                        <td><select name="s_phone" id="phone">
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="017">017</option>
                        </select> <label for="phone2">-</label> <input type="text" id="phone2"
                           name="s_phone" /> <label for="phone3">-</label> <input
                           type="text" id="phone3" name="s_phone" /></td>
                     </tr>
                  </tbody>
                  <tfoot>
                     <tr>
                        <td colspan="2">
                           <p class="btn">
                              <button id="btn_reg">저장</button>
                           </p>
                        </td>
                     </tr>
                  </tfoot>
               </table>
            </div>
            </form>
         </div>
         
         <!-- /.container -->
      </div>


   </div>
   <!-- /.container -->

   <!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2019</p>
      </div>
      <!-- /.container -->
   </footer>

   <!-- Bootstrap core JavaScript -->
   <script src="resources//js/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- 아코디언 스크립트 -->
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script src="resources/js/jquery-ui.min.js"></script>
   <script type="text/javascript">
   	$("#btn_reg").bind("click", function(){
   		document.frm.submit();
   	});
   			
   
   </script>

</body>

</html>
<%@page import="com.pub.vo.AnimemVO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	Object obj = session.getAttribute("mvo");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <title>유기견 정보</title>

 <link href="resources/css/text.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css"  rel="stylesheet" id="bootstrap-css">


<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<style>
	#img{
		width: 350px;
		height: 250px;
	}
	#btn{
		width: 100px; 
		height: 40px;
	}
		
	.t1{
		width: 100%;
		height: 150px;
	}
	.card-body{
		padding: 0;
	}
	.fa{
		color: red;
	}
		
</style>
<!--head-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<%
   if(obj == null){ 
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
      AnimemVO vo = (AnimemVO)obj;
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



<main>
    <section>
       <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" style="height: 500px;">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">             
              <a href="https://apms.epis.or.kr/wilddog/IndexMain3"><img class="d-block img-fluid" src="resources/images/boot1.JPG" width="800" height="350" alt="First slide" style="margin: 0 auto; "></a>
            </div>
            <div class="carousel-item">
              <a href="http://www.mafra.go.kr/mafra/355/subview.do;jsessionid=X31CHBZ8iATuQsXT2kBqvvV2.inst21?enc=Zm5jdDF8QEB8JTJGYmJzJTJGbWFmcmElMkY2NCUyRjMxOTA2MyUyRmFydGNsVmlldy5kbyUzRg%3D%3D"><img class="d-block img-fluid" src="resources/images/boot2.JPG" width="800" height="350" alt="Second slide" style="margin: 0 auto"></a>
            </div>
            <div class="carousel-item">
              <a href="https://www.animal.go.kr/front/community/show.do?boardId=boardID06&menuNo=7000000006&seq=300000"><img class="d-block img-fluid" src="resources/images/boot3.JPG" width="800" height="350" alt="Third slide" style="margin: 0 auto"></a>
            </div>
            <div class="carousel-item">
              <a href="https://apms.epis.or.kr/"><img class="d-block img-fluid" src="resources/images/boot4.JPG" width="800" height="350" alt="Third slide" style="margin: 0 auto"></a>
            </div>
            <div class="carousel-item">
              <a href="http://www.mafra.go.kr/mafra/1374/subview.do"><img class="d-block img-fluid" src="resources/images/boot5.JPG" width="800" height="350" alt="Third slide" style="margin: 0 auto"></a>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </section>

    <section id="features" class="py-5 bg-light">
        <div class="container">
            <div class="text-center py-4">
                <h1 class="jumbotron-heading">카테고리</h1>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <div class="box-part text-center">
                        <i class="text-primary fas fa-upload fa-3x mb-3" aria-hidden="true"></i>
                        <div class="title">
                            <h4>유기동물 등록</h4>
                        </div>
                        <div class="text mb-3">
                            <span>분실시 자세한 사항을 입력하시면 동물을 빠르게 찾을 수 있습니다.</span>
                        </div>
                        <a class="btn btn-outline-primary" href="ugiwrite.inc?bname=유기">페이지 이동</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="box-part text-center">
                        <i class="text-success fas fa-book fa-3x mb-3" aria-hidden="true"></i>
                        <div class="title">
                            <h4>유기동물 정책</h4>
                        </div>
                        <div class="text mb-3">
                            <span>동물보호법과 관련하여 여러가지 정보들을 자세하게 볼 수 있습니다.</span>
                        </div>
                        <a class="btn btn-outline-success" href="bbslist.inc?bname=정책">페이지 이동</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="box-part text-center">
                        <i class="text-success fas fa-book fa-3x mb-3" aria-hidden="true"></i>
                        <div class="title">
                            <h4>유기동물 공지</h4>
                        </div>
                        <div class="text mb-3">
                            <span>동물보호법과 관련하여 여러가지 정보들을 자세하게 볼 수 있습니다.</span>
                        </div>
                        <a class="btn btn-outline-success" href="bbslist.inc?bname=공지">페이지 이동</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="box-part text-center">
                        <i class="text-danger fas fa-home fa-3x mb-3" aria-hidden="true"></i>
                        <div class="title">
                            <h4>보호소 찾기</h4>
                        </div>
                        <div class="text mb-3">
                            <span>현재 주변에 있는 보호소를 검색을 통해 빠르게 찾을 수 있습니다.</span>
                        </div>
                        <a class="btn btn-outline-danger" href="shelter.inc">페이지 이동</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
    
    
     <section id="about-us" class="py-5">
        <div class="container">
            <div class="text-center py-4">
                <h1 class="jumbotron-heading">최근 10년간 유기견 통계</h1>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <a  href="#about-us">
                        <img src="resources/images/dog.png" class="d-block img-fluid" alt="...">
                    </a>
                </div>
                <div class="col-md-9">
                    
                    <p>
                    	<br/><br/>
                        <a href="javascript:goStat('2020')" class="btn btn-outline-primary" id="btn">2020년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2019')" class="btn btn-outline-primary" id="btn">2019년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2018')" class="btn btn-outline-primary" id="btn">2018년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2017')" class="btn btn-outline-primary" id="btn">2017년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2016')" class="btn btn-outline-primary" id="btn">2016년</a><br/><br/><br/>
                        
                        <a href="javascript:goStat('2015')" class="btn btn-outline-primary" id="btn">2015년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2014')" class="btn btn-outline-primary" id="btn">2014년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2013')" class="btn btn-outline-primary" id="btn">2013년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2012')" class="btn btn-outline-primary" id="btn">2012년</a>&emsp;&emsp;&emsp;
                        <a href="javascript:goStat('2011')" class="btn btn-outline-primary" id="btn">2011년</a>
                    </p>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
    

   
    <section id="testimonial" class="py-5 bg-light">
        <div class="container">
            <div class="text-center py-4">
                <h1 class="jumbotron-heading">최근 유기동물</h1>
            </div>
            <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-interval="10000">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[0].desertionNo }&nowPage=1&careNm=${ar[0].careNm }&careTel=${ar[0].careTel }">
                                        <img class="img-fluid" src="${ar[0].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        
				              <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[0].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[0].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[0].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[1].desertionNo }&nowPage=1&careNm=${ar[1].careNm }&careTel=${ar[1].careTel }">
                                        <img class="img-fluid" src="${ar[1].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        
                                        <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[1].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[1].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[1].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[2].desertionNo }&nowPage=1&careNm=${ar[2].careNm }&careTel=${ar[2].careTel }">
                                        <img class="img-fluid" src="${ar[2].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        
                                       <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[2].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[2].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[2].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" data-interval="2000">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[3].desertionNo }&nowPage=1&careNm=${ar[3].careNm }&careTel=${ar[3].careTel }">
                                        <img class="img-fluid" src="${ar[3].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[3].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[3].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[3].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[4].desertionNo }&nowPage=1&careNm=${ar[4].careNm }&careTel=${ar[4].careTel }">
                                        <img class="img-fluid" src="${ar[4].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[4].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[4].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[4].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card mb-4 shadow-sm">
                                    <a href="view.inc?desertionNo=${ar[5].desertionNo }&nowPage=1&careNm=${ar[5].careNm }&careTel=${ar[5].careTel }">
                                        <img class="img-fluid" src="${ar[5].popfile }" alt="" id="img">
                                    </a>
                                    <div class="card-body">
                                        <table class="t1">
				                 <tbody>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           공고번호
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[5].noticeNo}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           접수일자
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[5].happenDt}
				                        </td>   
				                     </tr>
				                     <tr>
				                        <td height="20" align="center" id="t_bg" bgcolor="#F8E0F7" width="70">
				                           발견장소
				                          </td>
				                        <td align="center" id="t_bg2" bgcolor="#EFFBEF" >
				                           ${ar[5].happenPlace}
				                        </td>   
				                     </tr>
				                 </tbody>
				              
				         
				              </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>

</main>

</head>
<body>

  <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   
<script>
 function goStat(year){
	  console.log(year);
	  location.href="stat2.inc?year="+year;
}
  </script>
</body>

</html>
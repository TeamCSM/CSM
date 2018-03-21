<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<title>CSM (코드로 사람을 만나다.)</title>
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/default.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/skin/board/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/animate.min.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/app.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--[if lt IE 9]>
<script src="http://ins.gs.hn/assets/js/html5shiv.min.js"></script>
<script src="http://ins.gs.hn/assets/js/respond.min.js"></script>
<![endif]-->
<style>
#header {/* 아래 img{}까지 꼭 필요한 코드 */
   background:url("/resources/include/img/header2.png")no-repeat;
    text-align: center;
    background-color: black;
    color: #fff;
}
#header img {
  display: block;
  margin: 0 auto 20px;
  height: 250px;
}
#header .container {
  padding-top: 100px;
  padding-bottom: 50px;
}
#header img {
  display: block;
  margin: 0 auto 20px;
  height: 250px;
}
#header .intro-text .name {
  display: block;
  font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
  text-transform: uppercase;
  font-weight: 700;
  font-size: 2em;
}
#header .intro-text .skills {
  font-size: 1.25em;
  font-weight: 300;
}
#header hr.star-light {border-color:#fff;}
@media (min-width: 768px) {
  #header .container {
    padding-top: 200px;
    padding-bottom: 100px;
  }
  #header .intro-text .name {
    font-size: 4.75em;
  }
  #header .intro-text .skills {
    font-size: 1.75em;
  }
}
section{
   padding: 0px 0; 
}
img{
   margin-top: -40px;
}
.dropbtn {/* header.jsp */
    background-color: #232327;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
}

.dropdown {/* header.jsp */
    position: relative;
    display: inline-block;
    margin-top:15px;
}

.dropdown-content {/* header.jsp */
   display:none;
    position: absolute;
    background-color: #232327;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {/* header.jsp */
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}/* header.jsp */

.dropdown:hover .dropdown-content {/* header.jsp */
    display: block;
}

.dropdown:hover .dropbtn {/* header.jsp */
    background-color: #232327;
}
a{/* header.jsp */
   color: #ffcc00;
   
}
a:link, a:visited{
   color:0;/* 일부러 오류 */
}
</style>
<script type="text/javascript">
	function loaded() {
		$('#mask').fadeOut(1000);
	}
	function wrapWindowByMask() {
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height(); 
//      var maskWidth = $(document).width();
        var maskWidth = window.document.body.clientWidth;
         
        var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:black; display:none; left:0; top:0;'>";
        mask += "<img src='/resources/include/img/csm_Lodding.gif' id='loadingImg'/>"
        mask += "</div>";
        //화면에 레이어 추가
        $('body')
            .append(mask);
           
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
       
        $('#loadingImg').css({
            'width' : maskWidth
            , 'height': maskHeight
            , 'opacity' : '1'
    });
     
        //마스크 표시
        $('#mask').show();   
    }
</script>
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://witch02.dothome.co.kr/01";
var g5_bbs_url   = "http://witch02.dothome.co.kr/01/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "notice";
var g5_sca       = "";
var g5_editor    = "smarteditor2";
var g5_cookie_domain = "";
$(function() {
	$('#attendanceCheck').click(function(event) {
		event.preventDefault();
		
		var popUrl = "/community/pointboard/PointBoard";	//팝업창에 출력될 페이지 URL

		var popOption = "width=420, height=350, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		
	});
});
</script>
<script src="http://witch02.dothome.co.kr/01/theme/01/js/jquery.min.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/jquery.menu.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/common.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/wrest.js"></script>
</head>
<style>
.navbar-brand{
    margin-top: 16px;
}
</style>
<body  id="page-top" class="index" onload="loaded();">
<script type="text/javascript">wrapWindowByMask();</script>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #232327; border-color: #232327;">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll" >
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img src="/resources/include/img/csm_logo.png" width="80" height="70" style="vertical-align: middle;  margin-bottom:17px; margin-top: 5px;
              margin-right: 20px; width:110px; height: 90px; margin-top: -40px;"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <div class="dropdown">
              <a href="/"><button class="dropbtn">메인</button></a>
            </div>
                <div class="dropdown">
              <button class="dropbtn">홈페이지 소개</button>
              <div class="dropdown-content">
                <a href="/community/homepage/homepage" style="color:#ffcc00;">홈페이지 소개</a>
                <a href="/community/homepage/pricing" style="color:#ffcc00;">CSM 팀</a>
              </div>
            </div>
                <div class="dropdown">
              <button class="dropbtn">매칭</button>
              <div class="dropdown-content">
                <a href="/program/listAll" style="color:#ffcc00;">개발자 구하기</a>
                <a href="/design/listAll" style="color:#ffcc00;">디자니어 구하기</a>
              </div>
            </div>
                <div class="dropdown">
              <button class="dropbtn">커뮤니티</button>
              <div class="dropdown-content">
                <a href="/community/freeboard/listPage" style="color:#ffcc00;">자유게시판</a>
                <a href="/community/questionboard/listPage" style="color:#ffcc00;">지식 In</a>
                <a href="#" id="attendanceCheck" style="color:#ffcc00;">출석체크</a>
              </div>
            </div>
            <div class="dropdown">
              <button class="dropbtn">포인트샵</button>
              <div class="dropdown-content">
                <a href="/market/marketHome" style="color:#ffcc00;">마켓홈</a>
                <a href="/market/item/itListPage" style="color:#ffcc00;">구매하기</a>
                <a href="/market/item/itemSellorGainHome" style="color:#ffcc00;">판매하기</a>
              </div>
            </div>
                <div class="dropdown">
              <button class="dropbtn">고객센터</button>
              <div class="dropdown-content">
                <a href="/customer/sNotice/list" style="color:#ffcc00;">공지사항</a>
                <a href="/customer/sBestq/list" style="color:#ffcc00;">자주찾는 질문</a>
                <a href="/customer/sBestm/list" style="color:#ffcc00;">1:1 문의</a>
              </div>
            </div>
                <!--<li class="page-scroll">
                    <a href="http://witch02.dothome.co.kr/01/bbs/board.php?bo_table=board" class="">게시판</a>
                </li>-->
                <c:choose>
                   <c:when test="${not empty login.user_id }">
                      <div class="dropdown">
                       <a href="/user/myPage/myPageHome"><button class="dropbtn">마이페이지</button></a>
                  </div>
                       <div class="dropdown">
                       <a href="/user/logout"><button class="dropbtn">로그아웃</button></a>
                  </div>
                    </c:when>
                    <c:otherwise>
                       <div class="dropdown">
                    <a href="/user/login"><button class="dropbtn">로그인</button></a>
                  </div>
                    </c:otherwise>
                </c:choose>               
           </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
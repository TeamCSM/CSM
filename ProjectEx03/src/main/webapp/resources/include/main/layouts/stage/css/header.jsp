<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->

<!-- jstl 시간 출력 태그 -->
%>
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
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/bootstrap.min.css"><!-- 문제 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/app.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--[if lt IE 9]>
<script src="http://ins.gs.hn/assets/js/html5shiv.min.js"></script>
<script src="http://ins.gs.hn/assets/js/respond.min.js"></script>
<![endif]-->
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
</script>
<script src="http://witch02.dothome.co.kr/01/theme/01/js/jquery.min.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/jquery.menu.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/common.js"></script>
<script src="http://witch02.dothome.co.kr/01/js/wrest.js"></script>
</head>
<body  id="page-top" class="index">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll" >
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">CSM</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right" style="background-color: #232327;">
                <li class="page-scroll">
                    <a href="/" >메인</a>
                </li>
                <li class="page-scroll">
                    <a href="#">회사소개</a>
                </li>
                <li class="page-scroll">
                    <a href="/program/listAll">매칭</a>
                </li>
                <li class="page-scroll">
                    <a href="/community/freeboard/listPage">커뮤니티</a>
                </li>
				<li class="page-scroll">
                    <a href="/market/marketHome">포인트샵</a>
                </li>
                <li class="page-scroll">
                    <a href="#">고객센터</a>
                </li>
                <!--<li class="page-scroll">
                    <a href="http://witch02.dothome.co.kr/01/bbs/board.php?bo_table=board" class="">게시판</a>
                </li>-->
                <c:choose>
                	<c:when test="${not empty login.user_id }">
                		<li class="page-scroll">
                    		<a href="/user/myPage/myPageHome" class="">마이페이지</a>
                    	</li>
                    	<li class="page-scroll">
                    		<a href="/user/logout" class="">로그아웃</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-scroll">
                    		<a href="/user/login" class="">로그인</a>
                    	</li>
                    </c:otherwise>
                </c:choose>               
                            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

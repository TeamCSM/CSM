<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<!-- META -->
<meta charset="utf-8">
<meta name="Generator" content="XpressEngine">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- TITLE -->
<title>CSM(코드로 사람을 만나다)</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/include/main/common/css/xe.min.css?20180210132711" />
<link rel="stylesheet"
	href="/resources/include/main/addons/oembed/jquery.oembed.min.css?20180127111757" />
<link rel="stylesheet"
	href="/resources/include/main/common/js/plugins/ui/jquery-ui.min.css?20180127111758" />
<link rel="stylesheet"
	href="/resources/include/main/layouts/stage/css/cameron.responsive.css?20170906173734" />
<link rel="stylesheet" href="/resources/include/main/layouts/stage/css/stage.css?20180212153422" />
<link rel="stylesheet"
	href="/resources/include/main/layouts/stage/fonts/nanumgothic.css?20170906173735" />
<link rel="stylesheet"
	href="/resources/include/main/modules/editor/styles/default/style.css?20180127111758" />
<link rel="stylesheet"
	href="/resources/include/main/addons/cameron_plugin/css/cameron_plugin.css?20170906173734" />
	<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/default.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/skin/board/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/animate.min.css">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/bootstrap.min.css"><!-- 문제 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic">
<link rel="stylesheet" href="http://witch02.dothome.co.kr/01/theme/01/css/app.css">
<!-- JS -->
<script>
var current_url = "http://www.bootm.co.kr/";
var request_uri = "http://www.bootm.co.kr/";
var current_mid = "page_owKU15";
var waiting_message = "서버에 요청 중입니다. 잠시만 기다려주세요.";
var ssl_actions = new Array();
var default_url = "http://www.bootm.co.kr/";
$(function() {
	$('#attendanceCheck').click(function(event) {
		event.preventDefault();
		
		var popUrl = "/community/pointboard/PointBoard";	//팝업창에 출력될 페이지 URL

		var popOption = "width=420, height=350, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		
	});
});
</script>
<!--[if lt IE 9]><script src="/common/js/jquery-1.x.min.js?20180127111758"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="/resources/include/main/common/js/jquery.min.js?20180127111758"></script>
<!--<![endif]-->
<script src="/resources/include/main/common/js/x.min.js?20180127111757"></script>
<script src="/resources/include/main/common/js/xe.min.js?20180127111758"></script>
<script src="/resources/include/main/addons/cameron_plugin/js/cameron_plugin.js?20170906173734"></script>
<!-- RSS -->
<link rel="alternate" type="application/rss+xml" title="Site RSS"
	href="http://www.bootm.co.kr/rss" />
<link rel="alternate" type="application/atom+xml" title="Site Atom"
	href="http://www.bootm.co.kr/atom" />
<!-- ICON -->

<script>
						if(!captchaTargetAct) {var captchaTargetAct = [];}
						captchaTargetAct.push("procBoardInsertDocument","procBoardInsertComment","procIssuetrackerInsertIssue","procIssuetrackerInsertHistory","procTextyleInsertComment");
						</script>
<script>
						if(!captchaTargetAct) {var captchaTargetAct = [];}
						captchaTargetAct.push("");
						</script>

<title></title>


<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '549793535168223');
  fbq('track', 'PageView');
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=549793535168223&ev=PageView&noscript=1" />
</noscript>
<!-- End Facebook Pixel Code -->


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-106141938-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-106141938-1');
</script>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
.xe_content {
	font-size: 16px;
}
</style>
<link rel="canonical" href="http://www.bootm.co.kr/" />
<meta property="og:locale" content="ko_KR" />
<meta property="og:type" content="website" />
<meta property="og:url" content="http://www.bootm.co.kr/" />
<meta property="og:title" content="NEW MAIN" />
<style type="text/css" id="settings">

.gif {
  height: 950px;
  width: 1423px;
  background-image: url(/resources/include/main/layouts/stage/css/csm_logo.gif);
  background-size: cover;
}
#lighting-nav li.nav1st-li {
	height: 20.2%
}

#lighting-nav .nav1st-1 {
	background-color: #c0c0c0;
	border-left-color: #c0c0c0;
}

#lighting-nav .nav1st-1.active {
	border-top-color: #c0c0c0
} /* 오른쪽 사이드 색깔 */
#lighting-nav .nav1st-1 .nav2nd-box li .fa-stack-2x {
	color: #c0c0c0
} /* 눌러서 동그라미 기본색깔  */
#lighting2 .nav1st-1 li a:hover>*, #lighting2 .nav1st-1 li a:focus>*,
	#lighting2 .nav1st-1 li.selected .fa, #lighting2 .nav1st-1 li.selected .nav2nd-tit
	{
	color: #21aeff
}

#stage-content .nav1st-1 h2 {
	background-color: #ddd222
}

#sTop.sTop-1:hover, #sTop.sTop-1:focus {
	background-color: #21aeff;
	border-color: #21aeff
}

#lighting-nav .nav1st-1 .nav1st-tit, #lighting-nav .nav1st-1 .nav2nd-box li .fa-stack-1x,
	#stage-content .nav1st-1 h2 {
	color: #fff
}

#lighting-nav .nav1st-1 .nav1st-tit {
	margin-top: -12px;
	font-size: 20px
}

#lighting-nav .nav1st-1 .nav2nd-box li {
	width: 25%
}

#lighting-nav .nav1st-2 {
	background-color: #535353;
	border-left-color: #535353
}

#lighting-nav .nav1st-2.active {
	border-top-color: #c0c0c0
} /* 오른쪽 사이드 색깔 */
#lighting-nav .nav1st-2 .nav2nd-box li .fa-stack-2x {
	color: #535353
} /* 눌러서 동그라미 기본색깔  */
#lighting2 .nav1st-2 li a:hover>*, #lighting2 .nav1st-2 li a:focus>*,
	#lighting2 .nav1st-2 li.selected .fa, #lighting2 .nav1st-2 li.selected .nav2nd-tit
	{
	color: #ddd222
}

#stage-content .nav1st-2 h2 {
	background-color: #a29900
}

#sTop.sTop-2:hover, #sTop.sTop-2:focus {
	background-color: #ddd222;
	border-color: #ddd222
}

#lighting-nav .nav1st-2 .nav1st-tit, #lighting-nav .nav1st-2 .nav2nd-box li .fa-stack-1x,
	#stage-content .nav1st-2 h2 {
	color: #fff
}

#lighting-nav .nav1st-2 .nav1st-tit {
	margin-top: -12px;
	font-size: 20px
}

#lighting-nav .nav1st-2 .nav2nd-box li {
	width: 33.333333333333%
}

#lighting-nav .nav1st-3 {
	background-color: #c0c0c0;
	border-left-color: #c0c0c0
}

#lighting-nav .nav1st-3.active {
	border-top-color: #c0c0c0
} /* 오른쪽 사이드 색깔 */
#lighting-nav .nav1st-3 .nav2nd-box li .fa-stack-2x {
	color: #c0c0c0
} /* 눌러서 동그라미 기본색깔  */
#lighting2 .nav1st-3 li a:hover>*, #lighting2 .nav1st-3 li a:focus>*,
	#lighting2 .nav1st-3 li.selected .fa, #lighting2 .nav1st-3 li.selected .nav2nd-tit
	{
	color: #21aeff
}

#stage-content .nav1st-3 h2 {
	background-color: #ddd222
}

#sTop.sTop-3:hover, #sTop.sTop-3:focus {
	background-color: #21aeff;
	border-color: #21aeff
}

#lighting-nav .nav1st-3 .nav1st-tit, #lighting-nav .nav1st-3 .nav2nd-box li .fa-stack-1x,
	#stage-content .nav1st-3 h2 {
	color: #fff
}

#lighting-nav .nav1st-3 .nav1st-tit {
	margin-top: -12px;
	font-size: 20px
}

#lighting-nav .nav1st-3 .nav2nd-box li {
	width: 50%
}

#lighting-nav .nav1st-4 {
	background-color: #535353;
	border-left-color: #535353
}

#lighting-nav .nav1st-4.active {
	border-top-color: #535353
} /* 오른쪽 사이드 색깔 */
#lighting-nav .nav1st-4 .nav2nd-box li .fa-stack-2x {
	color: #535353
} /* 눌러서 동그라미 기본색깔  */
#lighting2 .nav1st-4 li a:hover>*, #lighting2 .nav1st-4 li a:focus>*,
	#lighting2 .nav1st-4 li.selected .fa, #lighting2 .nav1st-4 li.selected .nav2nd-tit
	{
	color: #ddd222
}

#stage-content .nav1st-4 h2 {
	background-color: #a29900
}

#sTop.sTop-4:hover, #sTop.sTop-4:focus {
	background-color: #ddd222;
	border-color: #ddd222
}

#lighting-nav .nav1st-4 .nav1st-tit, #lighting-nav .nav1st-4 .nav2nd-box li .fa-stack-1x,
	#stage-content .nav1st-4 h2 {
	color: #fff
}

#lighting-nav .nav1st-4 .nav1st-tit {
	margin-top: -12px;
	font-size: 20px
}

#lighting-nav .nav1st-4 .nav2nd-box li {
	width: 50%
}

#lighting-nav .nav1st-5 {
	background-color: #c0c0c0;
	border-left-color: #c0c0c0
}

#lighting-nav .nav1st-5.active {
	border-top-color: #c0c0c0
} /* 오른쪽 사이드 색깔 */
#lighting-nav .nav1st-5 .nav2nd-box li .fa-stack-2x {
	color: #c0c0c0
} /* 눌러서 동그라미 기본색깔  */
#lighting2 .nav1st-5 li a:hover>*, #lighting2 .nav1st-5 li a:focus>*,
	#lighting2 .nav1st-5 li.selected .fa, #lighting2 .nav1st-5 li.selected .nav2nd-tit
	{
	color: #ddd222
}

#stage-content .nav1st-5 h2 {
	background-color: #ddd222
}

#sTop.sTop-5:hover, #sTop.sTop-5:focus {
	background-color: #21aeff;
	border-color: #21aeff
}

#lighting-nav .nav1st-5 .nav1st-tit, #lighting-nav .nav1st-5 .nav2nd-box li .fa-stack-1x,
	#stage-content .nav1st-5 h2 {
	color: #fff
}

#lighting-nav .nav1st-5 .nav1st-tit {
	margin-top: -12px;
	font-size: 20px
}

#lighting-nav .nav1st-5 .nav2nd-box li {
	width: 33.333333333333%
}

#stage-visual .visual .visual1 {
	background-image:
		url(http://www.bootm.co.kr/files/attach/images/3897/92f323074420f28af04d5f24da1ceb47.png)
}

#stage-visual .visual .visual1 .vtit1 {
	top: 100px;
	left: auto;
	right: 100px
}

#lighting-m, #TouchMe, #mobile-sign, #mobile-nav li.current1 a.nav1st,
	#stage-visual .sbtn li a {
	background-color: #ddd222
} /* 줄 새개 동그라미 기본색깔 */
#lighting-nav .nav2nd-box li a:hover .nav2nd-tit, #lighting-nav .nav2nd-box li a:focus .nav2nd-tit,
	#lighting-nav .nav2nd-box li a:hover .fa-stack-2x, #lighting-nav .nav2nd-box li a:focus .fa-stack-2x,
	#lighting-nav .nav2nd-box li.selected .fa-stack-2x, #mobile-nav li.current2 a.nav2nd,
	#mobile-nav li.current3 a.nav3rd {
	color: #ff0000
}
.icon{
	color:#c0c0c0;
}
</style>
<script>
//<![CDATA[
xe.current_lang = "ko";
xe.cmd_find = "찾기";
xe.cmd_cancel = "취소";
xe.cmd_confirm = "확인";
xe.msg_no_root = "루트는 선택 할 수 없습니다.";
xe.msg_no_shortcut = "바로가기는 선택 할 수 없습니다.";
xe.msg_select_menu = "대상 메뉴 선택";
//]]>
</script>
</head>
<body style="background-color: black;">

<!-- <section class="gif" contenteditable="false"> -->
<script>
/* $(document).ready(function () {
	var video = $('.video').attr('name');
	
	

	setTimeout(function(video) { 
		alert(video); 
	}document.getElementsByClass("video").innerHTML= video ,4000); 
});
 */
$nav1i = 5 - 1;
$nav_event = 'click';

</script>
<video src="/resources/include/main/media/csm_logo.mp4" autoplay="autoplay" style="width: 1700px; padding-right: 220px;" ></video>


<!-- <iframe src="media/csm_logo.mp4" class="csmFrame" frameborder="10" style="width: 100%;"></iframe> -->

<!-- <div class="gif" style=""></div> -->
<!-- <script type="text/javascript">
	 $('#logout').click(function(event) {
		 //event.preventDefault();
		 //alert("ㅁㅁ");
		 //FB.logout(function(response) {});
		 //location.href='';
	});
	</script>
<div id="test"> --><!-- 스크립트 -->
	<div id="stage-vi" class="cameron-body stage- newclearfix" style="height: 0;">
		<div id="logo"></div>
		<div id="lighting" class="newclearfix" >
			<header id="lighting-top" class="newclearfix">
				<div class="home-link">
					<a href="/" tabindex="2"><i
						class="fa fa-home icon-home"></i></a>
				</div>
				<div class="sign-link">
					<ul>
						<c:choose>
						<c:when test="${empty login}">
						<li><i class="fa fa-sign-in icon"></i>
						<a href="/user/login" tabindex="3">로그인</a></li>
						<li>
						<i class="fa fa-user-plus icon"></i>
						<a href="/user/join/signUpTerms" tabindex="4">회원가입</a></li>
						</c:when>
						<c:otherwise>
						<li><i class="fa fa-user icon"></i>
						<span style="color: white;">${login.user_name}님</span>
						<li>
						<li><i class="fa fa-sign-out icon"></i>
						<a href="/user/logout" id='logout'>로그아웃</a></li>
						<li><i class="fa fa-user icon"></i>
						<a href="/user/myPage/myPageHome" tabindex="6">마이페이지</a></li>
						<!-- <li><a href="#" tabindex="7"></a></li>
						<li><i class="fa fa-user-times icon"></i>
						<a href="#" tabindex="4">회원탈퇴</a></li> -->
						</c:otherwise>
						</c:choose>
						
					</ul>
				</div>
			</header>
			
			<nav id="lighting-nav" class="newclearfix">
				<ul>
					<li class="nav1st-li nav1st-3">
						<a href="#" class="tit">
							<strong class="nav1st-tit">회사소개</strong> 
							<em><img
									src="http://www.bootm.co.kr/layouts/stage/img/lighting_arrow.png"></em>
					</a>
						<!-- 시작 -->
			<div class="nav2nd-box">
				<ul class="newclearfix">
					<li><a href="/community/homepage/homepage">
								<div class="newclearfix">
									<span class="fa-stack fa-lg icon-stack"> 
										<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
										<i class="fa fa-youtube-play fa-stack-1x fa-inverse icon-youtube-play"></i>
									</span>
								</div> <strong class="nav2nd-tit">프로젝트 소개</strong>
						</a></li>
					<li><a href="/community/homepage/pricing">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack">
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-users fa-stack-1x fa-inverse icon-users"></i>
								</span>
							</div> <strong class="nav2nd-tit">팀원소개</strong>
					</a></li>
				</ul>
			</div></li>
		</li>
		<li class="nav1st-li nav1st-4"><a href="#" class="tit"> <strong
				class="nav1st-tit">매칭</strong> <em><img
					src="http://www.bootm.co.kr/layouts/stage/img/lighting_arrow.png"></em>
		</a>
			<div class="nav2nd-box">
				<ul class="newclearfix">
					<li><a href="/program/listAll">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									
									<i class="fa fa-user fa-stack-1x fa-inverse icon-user"></i>
								</span>
							</div> <strong class="nav2nd-tit">개발자 구하기</strong>
					</a></li>
					<li><a href="/design/listAll" target="tit">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-film fa-stack-1x fa-inverse icon-film"></i>
								</span>
							</div> <strong class="nav2nd-tit">디자이너 구하기</strong>
					</a></li>
				</ul>
			</div>
		</li>
		<li class="nav1st-li nav1st-5"><a href="#" class="tit"> <strong
				class="nav1st-tit">커뮤니티</strong> <em><img
					src="http://www.bootm.co.kr/layouts/stage/img/lighting_arrow.png"></em>
		</a>
			<div class="nav2nd-box">
				<ul class="newclearfix">
					<li><a href="/community/freeboard/listPage">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-comments-o fa-stack-1x fa-inverse icon-comments-o"></i>
								</span>
							</div> <strong class="nav2nd-tit">자유게시판</strong>
					</a></li>
					<li><a href="/community/questionboard/listPage">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
								    <i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-book fa-stack-1x fa-inverse icon-book"></i>
								</span>
							</div> <strong class="nav2nd-tit">지식IN</strong>
					</a></li>
					<li><a href="#" id="attendanceCheck">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-calendar-check-o fa-stack-1x fa-inverse icon-calendar-check-o"></i>
								</span>
							</div> <strong class="nav2nd-tit">출석체크</strong>
					</a></li>
				</ul>
			</div>
		</li>
		<li class="nav1st-li nav1st-2"><a href="#" class="tit"> <strong
				class="nav1st-tit">포인트샵</strong> <em><img
					src="http://www.bootm.co.kr/layouts/stage/img/lighting_arrow.png"></em>
		</a>
			<div class="nav2nd-box">
				<ul class="newclearfix">
					<li><a href="/market/marketHome">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-home fa-stack-1x fa-inverse icon-home"></i>
								</span>
							</div> <strong class="nav2nd-tit">포인트 마켓 메인</strong>
					</a></li>
					<li><a href="/market/item/itListPage">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-credit-card-alt fa-stack-1x fa-inverse icon-credit-card-alt"></i>
								</span>
							</div> <strong class="nav2nd-tit">구매하기</strong>
					</a></li>
					<li><a href="/market/item/itemSellorGainHome">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> <i
									class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-money fa-stack-1x fa-inverse icon-money"></i>
								</span>
							</div> <strong class="nav2nd-tit">판매하기</strong>
					</a></li>
				</ul>
			</div>
		</li>
		<li class="nav1st-li nav1st-1"><a href="#" class="tit"> <strong
            class="nav1st-tit">고객센터</strong> <em><img
               src="http://www.bootm.co.kr/layouts/stage/img/lighting_arrow.png"></em>
      </a>
         <div class="nav2nd-box">
                     <ul class="newclearfix">
                        <a href="/customer/sNotice/list">
                           <li>
                              <div class="newclearfix">
                                 <span class="fa-stack fa-lg icon-stack"> 
                                    <i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
                                    <i class="fa fa-bullhorn fa-stack-1x fa-inverse icon-bullhorn"></i>
                                 </span>
                           </div> 
                        <strong class="nav2nd-tit">공지사항</strong>
                        </a>
                  </li>				
					<li><a href="/customer/sContact/list">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-question-circle fa-stack-1x fa-inverse icon-question-circle"></i>
								</span>
							</div>
							<strong class="nav2nd-tit">1:1문의하기</strong>
						</a>
					</li>
					
					<li><a href="/customer/sBestq/list">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-th-list fa-stack-1x fa-inverse icon-th-list"></i>
								</span>
							</div> <strong class="nav2nd-tit">자주찾는 질문</strong>
					</a></li>
					<li><a href="/customer/sQna/list">
							<div class="newclearfix">
								<span class="fa-stack fa-lg icon-stack"> 
									<i class="fa fa-circle fa-stack-2x icon-circle icon-stack-base"></i>
									<i class="fa fa-commenting fa-stack-1x fa-inverse icon-commenting"></i>
								</span>
							</div> <strong class="nav2nd-tit">Q & A</strong>
					</a></li>
				</ul>		
		</div><!-- lighting end -->
		</li>
		</ul>
		</nav>
	</div>
</div>
	<!-- 메인사진 지움 -->
	<a id="lighting-m" href="#"></a>
	<div id="stage" class="stage-pc newclearfix" style="height: 0;">
		<div class="skipNav">
			<a href="#stage-visual" id="skip" tabindex="1">슬라이더로 바로가기</a>
		</div>
	</div>
	</div>
	<a href="#" style="display: none">rhwlsghkcocndgus XE1.9.3
		STAGE1.5.2</a>
	<div id="cameron_plugin" class="cameron_plugin"
		style="left: 0; top: px">
		<ul>
		</ul>
	</div>

	<!-- ETC -->
	<div class="wfsr"></div>
	<script src="/resources/include/addons/captcha/captcha.min.js?20180127111757"></script>
	<script src="/resources/include/main/addons/autolink/autolink.js?20180127111757"></script>
	<script src="/resources/include/main/addons/oembed/jquery.oembed.min.js?20180127111757"></script>
	<script src="/resources/include/main/addons/oembed/oembed.min.js?20180127111757"></script>
	<script src="/resources/include/main/common/js/plugins/ui/jquery-ui.min.js?20180127111758"></script>
	<script
		src="/resources/include/common/js/plugins/ui/jquery.ui.datepicker-ko.js?20180127111758"></script>
	<script src="/resources/include/main/addons/resize_image/js/resize_image.min.js?20180127111757"></script>
	<script
		src="/resources/include/main/layouts/stage/js/jquery.mobile.touch.min.js?20170906173735"></script>
	<script src="/resources/include/main/layouts/stage/js/visual.js?20170906173735"></script>
	<script
		src="/resources/include/main/layouts/stage/js/jquery.mobile.touch.updown.min.js?20170906173735"></script>
	<script src="/resources/include/main/layouts/stage/js/jquery.mousewheel.min.js?20170906173735"></script>
	<script src="/resources/include/main/layouts/stage/js/stage.js?20170906173735"></script>

	<!-- 지워라 -->
<!-- <script type="text/javascript">
$(document).ready(function(){
	testEle = $('#test');
	testEle.fadeOut(0);
	testEle.fadeIn(1000);
	
});
</script> -->
</section>
<!--  <div class="bottom" style="width: 2000px; height: 100px;
 	background-color: white; border-top-color: white;">
</div>  -->
<%@include file="/resources/include/main/layouts/stage/include/footer.jsp"%>
</body>
</html>

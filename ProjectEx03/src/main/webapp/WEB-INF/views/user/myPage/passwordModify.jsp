<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/css/mobile_shop.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/js/flexslider.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/js/owl.carousel.css?ver=161020">
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	<link rel='stylesheet prefetch'
		href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>
	<link rel='stylesheet prefetch'
		href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'>
		
<style>
h2{
	margin-left: 4%;
    margin-top: 2%;
}
form{
	width: 90%;
   	margin: auto;
}
input{
	width: 100%;
}
.form-control{
	height: 100%;
}
.text-center{
	width: 79.5%;
}
.form-group .has-feedback{
	margin-bottom: 4%;
}

.glyphicon{
	margin-top: 9px;
}
.text-center{
	width: 79.5%;
}
.dropdown{
	margin-top: 16px;
}
    
</style>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<link rel="stylesheet" href="/resources/user/css/matchingside.css">
<script src="/resources/user/js/matchingside.js"></script>
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://witch01.dothome.co.kr/0b";
var g5_bbs_url   = "http://witch01.dothome.co.kr/0b/bbs";
var g5_is_member = "1";
var g5_is_admin  = "";
var g5_is_mobile = "1";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
var g5_shop_url = "http://witch01.dothome.co.kr/0b/shop";
var g5_theme_shop_url = "http://witch01.dothome.co.kr/0b/theme/b/shop";
</script>
<script src="http://witch01.dothome.co.kr/0b/js/jquery-1.8.3.min.js"></script>
<script src="http://witch01.dothome.co.kr/0b/js/common.js?ver=161020"></script>
<script src="http://witch01.dothome.co.kr/0b/js/wrest.js?ver=161020"></script>
<script src="http://witch01.dothome.co.kr/0b/js/modernizr.custom.70111.js"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<script src="http://witch01.dothome.co.kr/0b/theme/b/js/owl.carousel.min.js"></script>
<script src="http://witch01.dothome.co.kr/0b/theme/b/js/jquery.flexslider.js"></script>
<script src="http://witch01.dothome.co.kr/0b/theme/b/js/Ublue-jQueryTabs-1.2.js"></script>
<style></style>
<div class="content-area" style="height: 105.6%;">
        <aside class="sidebar-area" role="complementary">
            <nav class="side-navigation fixed" role="navigation">
               <ul class="menu" style="width: 84.6%;">
               <li class="menu-item">
                        <a href="myPageHome" style="color:white;">마이페이지</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="passwordCheck" style="color:white;">회원정보 수정</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="passwordModify" style="color:white;">비밀번호 변경</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="/user/myPage/resumeStatistics" style="color:white;">이력서 통계</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="#" onclick="popupOpen();" style="color:white;">포인트 결제</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="#" onclick="popupOpen2();" style="color:white;">포인트 출금</a>
                    </li><!-- /.menu-item -->
                    <li class="menu-item">
                        <a href="#" id="delete" style="color:white;">회원 탈퇴</a>
                    </li><!-- /.menu-item -->
                 <li class="menu-item">
                        <a href="#" onclick="popupOpen3();" style="color:white;">쪽지함</a>
                    </li><!-- /.menu-item -->
               </ul><!-- /.menu -->
            </nav><!-- #site-navigation -->
        </aside><!-- #secondary -->
        <main class="site-main" role="main" style="margin: 0px;
	    width: 75%;
	    height: 100%;">
		<div id="container" style="margin-top: 100px; width: 100%;">
    <div id="container_s">
</div>
<section id="bo_list" class="container" style="padding: 280px 0; width: 40%;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function check() {
	var check = document.formdata;
	var count = 0;
	
	if(check.user_pass.value==""){
		$('#passMsg1').html("비밀번호를 입력을 해주세요.");
		check.user_pass.focus();
		count++;
	}
	if(check.user_newPass.value==""){
		$('#newPassMsg1').html("새로운 비밀번호를 입력을 해주세요.");
		check.user_newPass.focus();
		count++;
	}
	if(check.user_newPass2.value==""){
		$('#newPassMsg2').html("새로운 비밀번호 확인란에 입력을 해주세요.");
		check.user_newPass2.focus();
		count++;
	}
	if(check.user_newPass.value!=check.user_newPass2.value){
		$('#newPassMsg2').html("비밀번호가 다릅니다.").css({'color':'red'});
		check.user_newPass.focus();
		count++;
	}
	
	if(count>0){
		return false;
	}
}

$().ready(function() {
	if('${not empty param.msg}' == 'true') {
		alert('${param.msg}');
	}
});

$(document).ready(function() {
	$('#user_birthday').val($('#birth').val());
	
	$('#delete').click(function() {
		if(confirm('정말 탈퇴하시겠습니까?')) {
			location.href='delete';
		}
		else {
			location.reload();
		}
	});
});

function popupOpen() {

	var popUrl = "/user/myPage/pointPayment";	//팝업창에 출력될 페이지 URL

	var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

}

function popupOpen2() {

	var popUrl = "/user/myPage/pointWithdraw";	//팝업창에 출력될 페이지 URL

	var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

}

function popupOpen3() {

	var popUrl = "/user/message/messageHome";	//팝업창에 출력될 페이지 URL

	var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

}
</script>
<div class="password" class="panel" style="border-color: #E6E6E6!important;">
	<form method="post" name="formdata" onsubmit="return check();">
	<input type="hidden" id="pass" value="${modify.user_pass }">
		<div class="form-group has-feedback">
			<input type="password" id="paaa" name="user_pass" class="form-control"
				placeholder="기존 비밀번호를 입력하세요." /> <span
				class="glyphicon glyphicon-lock form-control-feedback"></span>
				<span id="passMsg1" class="error"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" name="user_newPass" class="form-control"
				placeholder="새로운 비밀번호를 입력하세요." /> <span
				class="glyphicon glyphicon-lock form-control-feedback"></span>
				<span id="newPassMsg1" class="error"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" name="user_newPass2" class="form-control"
				placeholder="새로운 비밀번호를 다시 한번 입력하세요." /> <span
				class="glyphicon glyphicon-lock form-control-feedback"></span>
				<span id="newPassMsg2" class="error"></span>
		</div>	
		<input type="submit" id="btnSubmit" value="비밀번호 변경하기" class="btn btn-sm btn-primary">
	</form>
</div>
</section>
</div>
</main>
</div>
<%@include file="/resources/include/footer.jsp" %>	
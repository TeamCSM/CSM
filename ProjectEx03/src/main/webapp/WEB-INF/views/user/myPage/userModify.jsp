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

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<link rel="stylesheet" href="/resources/user/css/matchingside.css">
<script src="/resources/user/js/matchingside.js"></script>
<style>
/* main너비 조정 */
.site-main{
	height: 100%;
}
/* footer너비 조정 */
.footer-above{
	width: 100%;
}
.footer-below{
    width: 100%;
}
</style>
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

<div class="content-area">
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
        <main class="site-main" role="main">
		<div id="container" style="margin-top: 100px; width: 100%;">
    <div id="container_s">
</div>
<section id="bo_list" class="container">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$().ready(function() {
	$( "#user_birthday" ).datepicker({
		showButtonPanel: true, //today
		changeMonth: true, //월 셀렉트 보이기
	    changeYear: true //년 셀렉트 보이기
	}); 
    $( "#user_birthday" ).datepicker( "option", "dateFormat", "yy-mm-dd");
    $( "#user_birthday" ).datepicker( "option", "showAnim", "slide" );
    $( "#ui-datepicker-div").css({'display':'none'});
    $('#user_birthday').val($('#birth').val());
    
    $("#signUpJuso").on('click', function() {
		
   	 new daum.Postcode({
            oncomplete: function(data) {
    			
            	var juso = document.formdata;
            	juso.user_mailNumber.value = data.zonecode;
            	juso.user_streetAddr.value = data.address;
            	             	
            	juso.user_detailedAddr.focus();
            }
        }).open({
			autoClose: true
        });
	});
});

function check() {
	var check = document.formdata;
	var count = 0;
	
	if(check.user_name.value==""){
		$('#nameMsg').html("이름을 입력 해주세요.");
		check.user_name.focus();
		count++;
	}
	if((check.user_gender[0].checked==false) && (check.user_gender[1].checked==false)){
		$('#user_genderMsg').html("성별을 입력 해주세요.");
		count++;
	}
	if(check.user_phone.value==""){
		$('#user_phoneMsg').html("휴대폰번호를 입력해주세요.");
		check.user_phone.focus();
		count++;
	}
	if(check.user_mailNumber.value==""){
		$('#user_jusoMsg').html("주소찾기를 통해 주소를 입력을 해주세요.");
		check.user_mailNumber.focus();
		count++;
	}
	if(check.user_streetAddr.value==""){
		$('#user_jusoMsg').html("주소찾기를 통해 주소를 입력을 해주세요.");
		check.user_streetAddr.focus();
		count++;
	}
	if(check.user_detailedAddr.value==""){
		$('#user_jusoMsg').html("상세주소를 입력을 해주세요.");
		check.user_detailedAddr.focus();
		count++;
	}
	
	if(count>0){
		return false;
	}
}

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
	<div class="login-box-body">	

			<form method="post" name="formdata" onsubmit="return check()">
			<fmt:parseDate value="${modify.user_birthday}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
			<input type="hidden" id="birth" value="<fmt:formatDate value='${dateFmt}' pattern='yyyy-MM-dd'/>">
				<div class="form-group has-feedback">
					<input type="text" name="user_id" class="form-control"
						placeholder="아이디" value="${modify.user_id }" readonly="readonly"/> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
						<span id="idMsg" class="error"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="user_name" class="form-control"
						placeholder="이름" value="${modify.user_name }"/> <span
						class="glyphicon glyphicon-pencil form-control-feedback"></span>
						<span id="nameMsg" class="error"></span>
				</div>
				
				
				<div id="user_genderDiv" >
					<span class="row_title blind"> 성별 </span><br /><br /> <span class="user_gender">
					<c:if test="${modify.user_gender eq '남자' }">
						<span class="jender">
							<input type="text" id="man" name="user_gender" value="남자" readonly="readonly" style="width: 100px; display: inline-block;">
							
						</span>
						<span class="jender">
							<input type="text" id="woman" name="user_gender" value="여자" readonly="readonly" style="width: 100px; display: inline-block;">
							
						</span>
					</c:if>
					
					<c:if test="${modify.user_gender eq '여자' }">
						<span class="jender">
							<input type="text" id="man" name="user_gender" value="남자">
							<label id="manLb" for="man">남자 </label>
						</span>
						<span class="jender">
							<input type="text" id="woman" name="user_gender" value="여자" checked="checked">
							<label id="womanLb" for="woman">여자 </label>
						</span>
					</c:if>
					</span> <span id="user_genderMsg" class="error"></span>
				</div>
				<div id="user_birthdayDiv" class="form-group has-feedback">
					<div class="join_birth">
						<input class="form-control" type="text" id="user_birthday" name="user_birthday" placeholder="생일">					
					</div><span
						class="glyphicon glyphicon-heart form-control-feedback"></span>
					<span id="user_birthdayMsg" class="error"></span>
				</div>
				<div id="user_emailDiv" class="form-group has-feedback">
					<input type="text" name="user_phone" id="user_phone" class="form-control"
						placeholder="휴대폰 번호" value="${modify.user_phone }"/><span
						class="glyphicon glyphicon-phone form-control-feedback"></span>
					<div id="user_phoneMsg" class="error"></div>
				</div>
				<div id="user_emailDiv" class="form-group has-feedback" style="text-align: left;">
					<input type="text" name="user_mailNumber" id="user_mailNumber" class="form-control"
						placeholder="우편번호" style="width: 150px; display: inline-block;" readonly="readonly" value="${modify.user_mailNumber }"/>&nbsp;&nbsp;
						<button type="button" class="btn btn-sm btn-primary" id="signUpJuso" style="display: inline-block;">주소 찾기</button>
						<input type="text" name="user_streetAddr" id="user_streetAddr" class="form-control"
						placeholder="도로명 주소" readonly="readonly" value="${modify.user_streetAddr }"/>
					<input type="text" name="user_detailedAddr" id="user_detailedAddr" class="form-control"
						placeholder="상세주소" value="${modify.user_detailedAddr }"/>
					<div id="user_jusoMsg" class="error"></div>
					
				</div>
				<span class="text-center">
				
				<input type="submit" id="btnSubmit" value="수정하기" class="btn btn-sm btn-primary"></span>
			</form>
			
		</div>
</section>
</div>
</main>
</div>
<%@include file="/resources/include/footer.jsp" %>
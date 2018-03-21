<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>


<html lang="ko">
<head>
	<title>CSM 포인트 마켓 &gt; 회원전환</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name='description' />
	<meta name='keywords' />
	<link rel='shortcut icon' href='https://sslimage.gmarket.co.kr/_Net/MyG/favicon/gmarket.ico' />	
	<link rel="apple-touch-icon-precomposed" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon-precomposed.png'/>
    <link rel="apple-touch-icon" href='https://sslimage.gmarket.co.kr/_Net/apple-touch-icon.png'/>

	<script type='text/javascript' src='https://www.gmarket.co.kr/challenge/neo_include/favicon_net.js'></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/json2.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="https://script.gmkt.kr/_Net/js/jquery.popupwindow.js"></script>
	<script type="text/javascript" src="/resources/market/js/Common.js" ></script>
	<script type="text/javascript" src="/resources/market/js/ScriptEventErrorHandler.js" ></script>
	<script type="text/javascript">
		$(document).jsErrorHandler();
		var _ContentUrls = ["http://script.gmkt.kr/_Net/css/myg/","http://image.gmarket.co.kr/_Net/","http://script.gmkt.kr/_Net/","https://script.gmkt.kr/_Net/css/myg/ssl/","https://sslimage.gmarket.co.kr/_Net/","https://script.gmkt.kr/_Net/","http://myg.gmarket.co.kr/","https://myg.gmarket.co.kr/","http://member.gmarket.co.kr/","https://member.gmarket.co.kr/","http://gbank.gmarket.co.kr/","https://gbank.gmarket.co.kr/","http://claim.gmarket.co.kr/","https://claim.gmarket.co.kr/","http://escrow.gmarket.co.kr/","https://sslescrow.gmarket.co.kr/","http://diary.gmarket.co.kr/","http://event.gmarket.co.kr/","http://sns.gmarket.co.kr/","http://www.gmarket.co.kr/","https://www.gmarket.co.kr/","http://item.gmarket.co.kr/","http://shop.gmarket.co.kr/","http://member2.gmarket.co.kr/","https://sslmember2.gmarket.co.kr/","http://promotion.gmarket.co.kr/","http://diary2.gmarket.co.kr/","http://eventnet.gmarket.co.kr/","http://ebay.gmarket.co.kr/","http://www.g9.co.kr/","http://signin.gmarket.co.kr/","https://signinssl.gmarket.co.kr/","http://english.gmarket.co.kr/","https://english.gmarket.co.kr/","http://pics.gmkt.kr/","https://pics.gmkt.kr/","/","/","/","/","/","/","/","/"];

    </script>
	<script type="text/javascript" src="https://script.gmkt.kr/_Net/js/dimmed.js"></script>
	<script type='text/javascript' src='https://script.gmkt.kr/_Net/js/gmkt.js?dummy=2012091327262'></script>
	<script type='text/javascript' defer='defer' src='https://script.gmkt.kr/_Net/js/impression.js'></script>
	
	<!-- 회원가입 Renewal //-->
	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/common.css" />	
	<script type="text/javascript" src="https://script.gmkt.kr/pc/js/ko/joinRenewal.js"></script>
	<!-- 회원가입 Renewal //-->

	<!--[if IE 6]>
		<script src="https://script.gmkt.kr/_Net/js/DD_belatedPNG.js"></script>
		<script>
			DD_belatedPNG.fix('#main_menu .menu_list span');
			DD_belatedPNG.fix('#main_menu .menu_list p');
		</script>
	<![endif]-->

	
	
<script type="text/javascript">
	$(document).ready(function () {

		var ctype = $("#CustType").val();

		$("#next").click(function () {

			var isAgree = true;
			$('input[name=agree]:checkbox').each(function () {
				if (!$(this).is(':checked')) {
					alert('필수동의항목에 모두 동의해주셔야 권한 신청을 할 수 있습니다.');
					isAgree = false;
					return false;
				}
			});

			if (isAgree) {
				if (ctype == "EPC") {
					$('#form1').attr('action', 'itemSellorGain').submit();
				} else if (ctype == "ECC") {
					$('#form1').attr('action', 'itemSellorGain').submit();
				} else {
					alert('권한 획득을 실패 하였습니다.');
					location.href = '/market/marketHome';
				}
			}
		});
		
		$("#cancel").click(function () {
			location.href = '/market/marketHome';
		});
	});
</script>


	<link rel="stylesheet" type="text/css" href="https://script.gmkt.kr/pc/css/ko/member_join.css?dummy=20170309" />
</head>

<body>

<div id="HeaderScriptContainer">
<script type="text/javascript">
	var headerKey = "SIMPLE";
	var GmarketHeaderComm = { BaroYN: "Y", Member: { IsLogin: "1", Grade: "family", Name: "전성표", Type: "1"} };
</script>
</div>
<script type="text/javascript" src="https://script.gmkt.kr/js/header/Header.utf8.js"></script>


	<div id="wrap">
        <a name="top"></a>
		<div id="contents">
			

<form id="form1" method="post" action="">
<input type="hidden" name="CustType" id="CustType" value="EPC">
<!-- container -->
<div id="container">
	<div class="join_wrap">
		<div id="join_container">
			<!-- join_header -->
			<div class="join_header">
				<h2 class="bg_area join_bg seller">판매자 신청</h2>
				
			</div>
			<!-- // join_header -->
			<div id="complet2" class="join_content">
				<p class="txt_info">CSM 포인트마켓 약관과 개인보호취급방침에 동의를 하셔야 판매자 신청이 가능합니다. </p>
				<p class="form">
					<label for=""><input type="checkbox" id="" name="" class="chk_all big agree">전체동의</label>
				</p>
				<div style="display:">
					<div class="typebox tab3_1 select">
						<h3 class="tit"><a href="#"><span class="">CSM 구매회원 약관</span></a></h3>
						<div class="text_box">
							<iframe marginwidth="0" marginheight="0" src="/resources/market/include/sellorTerm1.jsp" title="CSM 구매회원 약관"  frameborder="0" width="100%" topmargin="0"></iframe>
						</div>
					</div>
					<div class="typebox tab3_2">
						<h3 class="tit"><a href="#"><span>CSM 판매회원 약관</span></a></h3>
						<div class="text_box">
							<iframe marginwidth="0" marginheight="0" src="/resources/market/include/sellorTerm2.jsp" title="CSM 판매회원 약관" frameborder="0" width="100%" topmargin="0"></iframe>
						</div>
					</div>
					<div class="typebox tab3_3">
						<h3 class="tit"><a href="#"><span>전자 금융서비스 이용약관</span></a></h3>
						<div class="text_box">
							<iframe marginwidth="0" marginheight="0" src="/resources/market/include/sellorTerm3.jsp" title="전자 금융서비스 이용약관" frameborder="0" width="100%" topmargin="0"></iframe>
						</div>
					</div>
					<div class="form tm_required">
						<p class="txt_required">필수동의 항목</p>
						<ul>
							<li>
								<label for=""><input type="checkbox" id="agree1" name="agree" class="chk agree">CSM 구매회원 약관 동의</label>
							</li>
							<li>
								<label for=""><input type="checkbox" id="agree2" name="agree" class="chk agree">CSM 판매회원 약관 동의</label>
							</li>
							<li>
								<label for=""><input type="checkbox" id="agree3" name="agree" class="chk agree">전자 금융서비스 이용약관 동의</label>
							</li>
						</ul>
					</div>
				</div>
				<div class="tab_type tab_mid">
					<div class="typebox tab2_1 select">
						<h3 class="tit"><a href="#"><span>개인정보 수집 및 이용</span></a></h3>
						<div class="text_box">
							<iframe marginwidth="0" marginheight="0" src="/resources/market/include/sellorTerm4.jsp" title="개인정보 수집 및 이용" frameborder="0" width="100%" topmargin="0"></iframe>
						</div>
					</div>
					<div class="typebox tab2_2">
						<h3 class="tit"><a href="#"><span>CSM 판매회원의 개인정보준수사항</span></a></h3>
						<div class="text_box">
							<iframe marginwidth="0" marginheight="0" src="/resources/market/include/sellorTerm5.jsp" title="CSM 판매회원의 개인정보준수사항" frameborder="0" width="100%" topmargin="0"></iframe>
						</div>
					</div>
					<div class="form tm_required ">
						<p class="txt_required">필수동의 항목</p>
						<ul>
							<li>
								<label for=""><input type="checkbox" id="agree4" name="agree" class="chk agree">개인정보 수집 및 이용에 관한 사항 동의</label>
							</li>
							<li>
								<label for=""><input type="checkbox" id="agree5" name="agree" class="chk agree">CSM 판매회원의 개인정보준수사항 동의</label>
							</li>
							<li>
								<label for=""><input type="checkbox" id="agree6" name="agree" class="chk agree">본인은 현재 사업자 등록을 하지 않은 사실을 확인합니다.</label>
							</li>
						</ul>
					</div>
				</div>
				<p class="form all_bt">
					<label for=""><input type="checkbox" id="" name="" class="chk_all big agree">전체동의</label>
				</p>
			</div>
			<!-- // joinContent -->
			<div class="btn_zone agree">
				<a href="#" id="cancel" class="bg_area btn_bg l2"><span>처음으로</span></a>
				<a href="#" id="next" class="bg_area btn_bg l1 md"><span>확인</span></a>
			</div>
		</div> 
		<!--// join_container -->
	</div>
</div>
<!-- //container -->
</form>

		</div>
	</div>
	
<div id="FooterScriptContainer">
</div>
<script type="text/javascript" src="https://script.gmkt.kr/js/header/Footer.utf8.js"></script>

	<!-- Jira : BC9186-24 -->
	

</body>

<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>
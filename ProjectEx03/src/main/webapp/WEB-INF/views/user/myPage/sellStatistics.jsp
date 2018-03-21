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
<script>
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
	
	$('#exceDownLoding').click(function() {
		
		$.ajax({
			url:"/user/myPage/sellingItemExcal", 
			success : function(data){
				alert("엑셀 다운 성공 다운로드 폴더를 살펴보세요.");
			},
			error : function(e){
				alert("오류발생 : "+e.status+" "+e.statusText);
			}
		}); 
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
<div class="content-area" style="height: 144%;">
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
		<div id="container" style="margin-top: 100px; width: 113%;">
    <div id="container_s">
</div>
</div>
<div id="container">
<section id="bo_list" class="container" style="margin-left: 10px; padding: 29px 0;">
<div class="container"> 
<input type="button" value="엑셀다운"  id="exceDownLoding"
	style="width: 15%;
    float: right;
    margin-right: 15%;
    margin-bottom: 3%;"/>
</div>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['month', '판매 건수'],
       	  ['1월',  parseInt('${sell.jan }')],
       	  ['2월',  parseInt('${sell.feb }')],
       	  ['3월',  parseInt('${sell.mar }')],
       	  ['4월',  parseInt('${sell.apr }')],
       	  ['5월',  parseInt('${sell.may }')],
       	  ['6월',  parseInt('${sell.jun }')],
       	  ['7월',  parseInt('${sell.jul }')],
       	  ['8월',  parseInt('${sell.aug }')],
       	  ['9월',  parseInt('${sell.sep }')],
       	  ['10월', parseInt('${sell.oct }')],
       	  ['11월', parseInt('${sell.nov }')],
       	  ['12월', parseInt('${sell.dec }')]
        ]);

        var options = {
          title: '월별 판매건수'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_sellCount'));
        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['month', '판매 금액'],
       	  ['1월',  parseInt('${price.jan }')],
       	  ['2월',  parseInt('${price.feb }')],
       	  ['3월',  parseInt('${price.mar }')],
       	  ['4월',  parseInt('${price.apr }')],
       	  ['5월',  parseInt('${price.may }')],
       	  ['6월',  parseInt('${price.jun }')],
       	  ['7월',  parseInt('${price.jul }')],
       	  ['8월',  parseInt('${price.aug }')],
       	  ['9월',  parseInt('${price.sep }')],
       	  ['10월', parseInt('${price.oct }')],
       	  ['11월', parseInt('${price.nov }')],
       	  ['12월', parseInt('${price.dec }')]
        ]);

        var options = {
          title: '월별 판매금액',
          colors: ['red']
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_sellPrice'));
        chart.draw(data, options);
      }
    </script>
   
<div id="chart_sellCount" style="width: 900px; height: 500px; margin-left: 16%;"></div>
<div id="chart_sellPrice" style="width: 900px; height: 500px; margin-left: 16%;"></div>
</section>
</div>
</div>
</main>
<%@include file="/resources/include/footer.jsp" %>
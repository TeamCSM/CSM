<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>
   
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
   <link rel="stylesheet" href="/resources/user/css/matchingside.css?ver=1">
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
<style>
.text-center{
   width: 79.5%;
}
.dropdown{
   margin-top: 16px;
}
a:link, a:visited{
   
}
a{/* header.jsp */
   color: #ffcc00; 
}  
</style>
<div class="content-area" style="background-color: gray; width: 100%;
    height: 150%;">
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
      <div id="container" style="margin-top: 100px; width: 100%;"><!-- css 기본틀 -->
    <div id="container_s">
</div>
   <h1 id="container_title" style="margin: 30px 0 0; margin-left: 10px; margin-top: 55px;
      margin-right: 20px; margin-bottom: 35px;">마이페이지</h1><div id="smb_my">
      
    <section id="smb_my_ov" style="padding: 30px 0; width: 90%;
    margin-left: 70px;">
   
        <h2>회원정보 개요</h2>
        <div class="hello_name">
            <i class="fa fa-user" aria-hidden="true"></i>  <strong>${myPage.user_name }</strong>님
            <ul class="smb_my_act">
                                <li><a href="passwordCheck" class="btn02">회원정보수정</a></li>
                <li><a href="#" id="delete" class="btn02">회원탈퇴</a></li>
            </ul>
        </div>
        <c:if test="${myPage.user_authority eq 'SELLOR'}">
        <div class="my_cou my_po"><button class="btn btn-sm btn-primary" onclick="location.href='/user/myPage/sellStatistics'">판매 통계</button></div>
        </c:if>
        <div class="my_point my_po">보유포인트
        <a href="#" onclick="popupOpen();" class="win_point">${myPage.user_point }점</a></div>
        <div class="my_point my_po">쪽지함<a href="#" onclick="popupOpen3(); return false;" target="_blank">${message.count }</a></div>
        <div class="my_info">

            <div class="my_info_wr">
                <strong>연락처</strong>
                <span>${myPage.user_phone }</span>
            </div>
            <div class="my_info_wr">
                <strong>E-Mail</strong>
                <span>${myPage.user_email }</span>
            </div>
            <div class="my_info_wr">
                <strong>자동로그인 유무</strong>
                <c:choose>
                	<c:when test="${not empty login.useCookie}">
                		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Y</span>
                	</c:when>
                	<c:otherwise>
                		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;N</span>
                	</c:otherwise>
                </c:choose>
             </div>
            <div class="my_info_wr">
            <strong>회원가입일시</strong>
                <span>${myPage.user_regdate }</span>
            </div>
            <div class="my_info_wr ov_addr">
                <strong>주소</strong>
                <span>${myPage.user_streetAddr } ${myPage.user_detailedAddr }</span>
            </div>
        </div>
    </section>

    <div id="smb_my_tab" style="width: 90%;
    margin-left: 70px; margin-bottom: 5%;">
        <ul class="tabsTit">
            <li class="tabsTab tabsHover">구매 리스트</li>
            <li class="tabsTab">상품 문의</li>
            <li class="tabsTab">상품 리뷰</li>
        </ul>
        <div class="tabsCon">
            <section id="smb_my_od" class="tabsList" readonly="true">
                <h2>최근 주문내역</h2>
                

<script>
$().ready(function() {
$('.reviewView').click(function(event) {
   event.preventDefault();
   
   var reviewViewTarget = $(this).attr('href');
   if($('#'+reviewViewTarget).css('display')=='none'){
      $('#'+reviewViewTarget).css({'display':'table-row'});
   }else{
      $('#'+reviewViewTarget).css({'display':'none'});
   }
});
$('.inquiryView').click(function(event) {
   event.preventDefault();
   
   var inquiryViewTarget = $(this).attr('href');
   if($('#'+inquiryViewTarget).css('display')=='none'){
      $('#'+inquiryViewTarget).css({'display':'table-row'});
   }else{
      $('#'+inquiryViewTarget).css({'display':'none'});
   }
});
});
</script>
<div id="sod_inquiry">
   <table class="table table-hover">
   <thead class="thead-inverse">
      <tr>
         <th style="text-align:center;">이미지</th>
         <th style="text-align:center;">상품명</th>
         <th style="text-align:center;">가  격</th>
         <th style="text-align:center;">수  량</th>
         <th style="text-align:center;">판매자</th>
         <th style="text-align:center;">구매일</th>
      </tr>
   </thead>
      <c:forEach items="${buy }" var="buy">
         <tr>
            <td style="text-align:center;">
            <span class="total_img">
               <c:choose>
                  <c:when test="${not empty buy.item_photoName}">
                     <img src="${buy.item_photoName}" width="80" height="80" alt="">
                  </c:when>
                  <c:otherwise>
                     <img src="/resources/market/img/noimg.jpg" width="80" height="80" alt="">
                  </c:otherwise>
               </c:choose>
            </span>
            </td>
            <td style="text-align:center;">${buy.item_name }</td>
            <td style="text-align:center;">${buy.item_price }</td>
            <td style="text-align:center;">${buy.item_amount }</td>
            <td style="text-align:center;">${buy.item_sellerId }</td>
            <td style="text-align:center;">${buy.log_regdate }</td>
         </tr>
      </c:forEach>
   </table>
</div>
                <a href="/market/order/orderProcessList" class="more_btn">더보기</a>
            </section>

            <section id="smb_my_wish" class="tabsList" >
                <h2>최근 위시리스트</h2>

                <table class="table table-hover">
   <thead class="thead-inverse">
      <tr>
         <th style="text-align:center;">제  목</th>
         <th style="text-align:center;">작성일</th>
      </tr>
   </thead>
      <c:forEach items="${inquiry }" var="inquiry">
         <tr>
            <td style="text-align:center;"><a href='inquiry_${inquiry.inquiry_idx}' class="inquiryView" style="text-decoration: none;">${inquiry.inquiry_title }</a></td>
            <td style="text-align:center;">${inquiry.inquiry_regdate }</td>
         </tr>
         <tr style="display: none;" id="inquiry_${inquiry.inquiry_idx}">
            <td colspan="2" style="text-align:center;">${inquiry.inquiry_contents }</td>
         </tr>
      </c:forEach>
   </table>
                <a href="#" class="more_btn">더보기</a>
            </section>
            
            <section id="smb_my_wish" class="tabsList" >
                <h2>최근 위시리스트</h2>

                <table class="table table-hover">
   <thead class="thead-inverse">
      <tr>
         <th style="text-align:center;">제  목</th>
         <th style="text-align:center;">작성일</th>
         <th style="text-align:center;">평  점</th>
      </tr>
   </thead>
      <c:forEach items="${review }" var="review">
         <tr>
            <td style="text-align:center;"><a href='review_${review.review_idx }' class="reviewView" style="text-decoration: none;">${review.review_title }</a></td>
            <td style="text-align:center;">${review.review_regdate }</td>
            <c:choose>
				<c:when test="${review.review_score eq 5}">
					<td style="text-align:center; vertical-align: middle;">
						<label for="is_score10">매우만족</label>
                    			<img src="http://witch01.dothome.co.kr/0b/shop/img/s_star5.png">
					</td>
				</c:when>
				<c:when test="${review.review_score eq 4}">
					<td style="text-align:center; vertical-align: middle;">
						<label for="is_score8">만족</label>
                 			     <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star4.png">
					</td>
				</c:when>
				<c:when test="${review.review_score eq 3}">
					<td style="text-align:center; vertical-align: middle;">
						<label for="is_score6">보통</label>
                  		    <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star3.png">
					</td>
				</c:when>
				<c:when test="${review.review_score eq 2}">
					<td style="text-align:center; vertical-align: middle;">
						<label for="is_score4">불만</label>
                    			  <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star2.png">
					</td>
				</c:when>
				<c:when test="${review.review_score eq 1}">
					<td style="text-align:center; vertical-align: middle;">
						<label for="is_score2">매우불만</label>
                     			 <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star1.png">
					</td>
				</c:when>
			</c:choose>
         </tr>
         <tr style="display: none;" id="review_${review.review_idx}">
            <td colspan="3" style="text-align:center;">${review.review_contents }</td>
         </tr>
      </c:forEach>
   </table>
                <a href="#" class="more_btn">더보기</a>
            </section>
        </div>
    </div>

    <script>
    $("#smb_my_tab").UblueTabs({
        eventType:"click"
    });
    </script>

</div>

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
});

function popupOpen() {

   var popUrl = "/user/myPage/pointPayment";   //팝업창에 출력될 페이지 URL

   var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

      window.open(popUrl,"",popOption);

}

function popupOpen2() {

   var popUrl = "/user/myPage/pointWithdraw";   //팝업창에 출력될 페이지 URL

   var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

      window.open(popUrl,"",popOption);

}

function popupOpen3() {

   var popUrl = "/user/message/messageHome";   //팝업창에 출력될 페이지 URL

   var popOption = "width=700, height=700, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

      window.open(popUrl,"",popOption);

}
</script>
    </div>
</div>

<script src="http://witch01.dothome.co.kr/0b/js/scroll_oldie.js"></script>
<!-- } 오늘 본 상품 끝 -->               

<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->
<%@include file="/resources/include/footer.jsp"%>
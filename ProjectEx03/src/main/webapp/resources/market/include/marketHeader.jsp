<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
<meta name="HandheldFriendly" content="true">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<title>CSM 포인트샵</title>
<!-- 부트스트랩, jquery 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 템플릿 링크 -->


<link rel="stylesheet" href="/resources/include/css/moblie.css">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/js/flexslider.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/latest/basic/style.css?ver=161020">
<link rel="stylesheet" href="http://witch01.dothome.co.kr/0b/theme/b/js/owl.carousel.css?ver=161020">
<!--[if lte IE 8]>
<script src="http://witch01.dothome.co.kr/0b/js/html5.js"></script>
<![endif]-->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://witch01.dothome.co.kr/0b";
var g5_bbs_url   = "http://witch01.dothome.co.kr/0b/bbs";
var g5_is_member = "";
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
<script src="http://witch01.dothome.co.kr/0b/theme/b/js/jquery.shop.list.js"></script>
<script src="http://witch01.dothome.co.kr/0b/theme/b/js/Ublue-jQueryTabs-1.2.js"></script>

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
</head>
<body onload="loaded();">

<header id="hd">
    <h1>쇼핑몰0B</h1>
    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>

    
<!-- 팝업레이어 시작 { -->
<div id="hd_pop">
    <h2>팝업레이어 알림</h2>

<span class="sound_only">팝업레이어 알림이 없습니다.</span></div>

<script>
wrapWindowByMask();
$(function() {
    $(".hd_pops_reject").click(function() {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        $("#"+id[1]).css("display", "none");
        set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
    });
    $('.hd_pops_close').click(function() {
        var idb = $(this).attr('class').split(' ');
        $('#'+idb[1]).css('display','none');
    });
    if('${not empty param.msg}' == 'true'){
    	alert('${param.msg}');
    }
    $('.unReady').click(function(event) {
    	event.preventDefault();
    	
    	alert("준비중");
	});
});
</script>
<!-- } 팝업레이어 끝 -->    <div id="hd-tnb">
	    <ul class="hd-tnb-inner">
                <li class="page-scroll">
                    <a href="/" >메인</a>
                </li>
                <li class="page-scroll">
                    <a href="/community/homepage/homepage">홈페이지소개</a>
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
                    <a href="/customer/sNotice/list">고객센터</a>
                </li>
                <!--<li class="page-scroll">
                    <a href="http://witch02.dothome.co.kr/01/bbs/board.php?bo_table=board" class="">게시판</a>
                </li>-->
                <c:choose>
	                <c:when test="${empty login.user_id}">
		                <li class="page-scroll">
		                    <a href="/user/login" class="">로그인</a>
		                </li>
	                </c:when>
	                <c:otherwise>
	                	<li class="page-scroll">
		                    <a href="/user/myPage/myPageHome" class="">마이페이지</a>
		                </li>
		                <li class="page-scroll">
		                    <a href="/user/logout" class="">로그아웃</a>
		                </li>
	                </c:otherwise>
                </c:choose>
           </ul>
          
	 
    </div>

    <div class="nav">
    	<div class="nav-inner">
	        <div id="logo"><a href="/market/marketHome"><img src="/resources/include/img/csm_logo.png" width="80" height="70" style="vertical-align: middle;  margin-bottom:17px; margin-top: 5px;
	        	margin-right: 20px; width:110px; height: 90px;"></a></div>
	        <div id="hd_sch" style="margin-top: 36px;">
	            <h3>쇼핑몰 검색</h3>
	            <form name="frmsearch1" action="http://witch01.dothome.co.kr/0b/shop/search.php" onsubmit="return search_submit(this);">
	            <input type="text" name="q" value="" id="sch_str" required>
	            <label for="sch_str" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
	            <button type="submit" id="sch_submit"><i class="fa fa-search" aria-hidden="true"></i><span class="sound_only">검색</span></button>
	            </form>
	            <script>
	            function search_submit(f) {
	                if (f.q.value.length < 2) {
	                    alert("검색어는 두글자 이상 입력하십시오.");
	                    f.q.select();
	                    f.q.focus();
	                    return false;
	                }
	
	                return true;
	            }
	            </script>
	        </div>
	        <ul id="hd_icon">
	            <li><a href="/market/cart/cartList">
	            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
	            <span class="sound_only">장바구니</span>
	            <span class="cart-count" id="cart-count">0</span></a></li>
	            <li><button type="button" id="meneu_open"><i class="fa fa-bars" aria-hidden="true"></i><span class="sound_only">전체메뉴</span></button></li>
	        </ul>
	        
	                </div>
    </div>

    
<div id="category">
    <div class="cate_bg"></div>
    <div class="ct_wr">        
        <div id="hd_tnb">
        	<c:choose>
        		<c:when test="${empty login.user_id}">
            		<a href="/user/login" class="tnb_login">로그인</a>
            	</c:when>
	            <c:otherwise>
		            <a href="/user/myPage/myPageHome" class="tnb_my">마이페이지</a>
		            <a href="/user/logout" class="tnb_logout">로그아웃</a>
	            </c:otherwise>
            </c:choose>
            <!--회원가입 사용시 로그인 class="tnb_my"로 변경해서 사용하세요-->
            <!--<a href="http://witch01.dothome.co.kr/0b/bbs/register.php" class="tnb_logout">회원가입</a>-->
                    </div>

        <ul id="hd_mb">
            <li><a href="/market/order/orderProcessList">주문조회</a></li>
            <li><a href="/market/cart/cartList">장바구니</a></li>
            <li><a href="/customer/sNotice/list">고객센터</a></li>
            <li><a href="/customer/sContact/list">문의하기</a></li>
            <li><a href="#" class="unReady">이벤트</a></li>
            <li><a href="/market/item/itemSellorGainHome">판매하기</a></li>

        </ul>
		
        <ul class="tabsTit">
            <li class="tabsTab tabsHover">shop</li>
            <li class="tabsTab">board</li>
        </ul>
        <div class="tabsCon">
            <div class="tabsList" readonly="true">
                <h2 class="con_tit"><span>쇼핑몰분류</span></h2>
                <ul class="cate">
                    <li>
                        <a href="/market/item/itListPage">IT 상품</a>
                    </li>
                    <li>
                        <a href="/market/item/bookListPage">BOOK 상품</a>
                    </li>
                    
                </ul>
            </div>
            <div class="tabsList">
                <div class="tabsList" readonly="true">
                <h2 class="con_tit"><span>쇼핑몰분류</span></h2>
                <ul class="cate">
                   <li>
                      <a href="/market/item/itemRegister">상품 등록</a>
                   </li>
                   <li>
                      <a href="/market/item/myItemList">등록한 상품</a>
                   </li>
                   <li>
                      <a href="/market/order/myOrderItemList">주문된 상품</a>
                   </li>
                </ul>
            </div>
            </div>
        </div>
    </div>

   <button type="button" class="category_close"><span class="sound_only">카테고리 닫기</span></button>

</div>

<script>
$(function (){
	
    $("#category").UblueTabs({
        eventType:"click" 
    });

    var $category = $("#category");

    $("#hd_ct").on("click", function() {
        $category.css("display","block");
    });

    $("#category .category_close").on("click", function(){
        $category.css("display","none");
    });

     $(".cate_bg").on("click", function() {
        $category.css("display","none");
    });

    $("button.sub_ct_toggle").on("click", function() {
        var $this = $(this);
        $sub_ul = $(this).closest("li").children("ul.sub_cate");

        if($sub_ul.size() > 0) {
            var txt = $this.text();

            if($sub_ul.is(":visible")) {
                txt = txt.replace(/닫기$/, "열기");
                $this
                    .removeClass("ct_cl")
                    .text(txt);
            } else {
                txt = txt.replace(/열기$/, "닫기");
                $this
                    .addClass("ct_cl")
                    .text(txt);
            }

            $sub_ul.toggle();
        }
    });
});
   
</script>
    
    <script>
    $(window).scroll(function(){
      var sticky = $('.nav'),
          scroll = $(window).scrollTop();

      if (scroll >= 10) sticky.addClass('fixed');
      else sticky.removeClass('fixed');
    });
    $("#meneu_open").on("click", function() {
        $("#category").toggle();
    });
    </script>
    </div>
</header>
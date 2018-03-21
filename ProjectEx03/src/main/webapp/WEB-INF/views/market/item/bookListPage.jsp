<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>

<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">BOOK 리스트</h1>
<script>
var g5_shop_url = "http://witch01.dothome.co.kr/0b/shop";
</script>
<script src="http://witch01.dothome.co.kr/0b/js/shop.mobile.list.js"></script>

<div id="sct">

    <div id="sct_hhtml"></div>
<section id="best_item">
<script type="text/javascript">
$().ready(function() {
	
	var count = 0;
	<c:forEach items="${bastItem}" var="bastItem" varStatus="loop">
		count++;
	</c:forEach>
	if(count == 4){
		count = 0;
	}else if(count == 3){
		count = 1;
	}else if(count == 2){
		count = 2;
	}else if(count == 1){
		count = 3;
	}else if(count == 0){
		count = 4;
	}

	var i = 0;
	var str = "";
	for(i ; i<count; i++){
		str += '<div class="sct_li item">';
		str += '<div class="sct_img"><span class="best_icon">BEST ITEM</span><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">';
		str += '<img src="/resources/market/img/book_img.jpg" width="230" height="230" alt="상품 B1">';
		str += '</a></div><div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">임시상품</a></div>';
		str += '<div class="sct_cost">999999</div></div>';
	}

	$('#bestItems').append(str);
});
</script>

<h2>베스트상품</h2>
<div class="sct_best" id="bestItems">

<c:forEach items="${bastItem}" var="bastItem" varStatus="loop">
<div class="sct_li item">
<div class="sct_img"><span class="best_icon">BEST ITEM</span><a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
<c:choose>
	<c:when test="${empty bastItem.item_photoName}">
		<img src="/resources/market/img/noimg.jpg" width="230" height="230" >
	</c:when>
	<c:otherwise>
		<img src="${bastItem.item_photoName}" width="230" height="230" alt="상품 B1">
	</c:otherwise>
</c:choose>
</a></div>
<div class="sct_txt"><a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
${bastItem.item_name}
</a></div> 
<div class="sct_cost">
${bastItem.item_price}
</div>
</div>
</c:forEach>
</div>
</section>


<script>
$(document).ready(function() {
    $(".sct_best").owlCarousel({
       pagination:true,
       navigation : false,
       itemsScaleUp : true,
       items : 4,
       itemsDesktop : [1199,4],
       itemsDesktopSmall : [970,2],
       itemsTablet :[768,2],
       itemsTablet: [640,2],
       itemsMobile : [479,2],
    });
});
</script>

<!-- 상품 정렬 선택 시작 { -->
<section id="sct_sort">
    <h2>상품 정렬</h2>

    <select id="ssch_sort"  onChange="window.location.href=this.value">
        <option>상품정렬</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_sum_qty&amp;sortodr=desc">판매많은순</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_price&amp;sortodr=asc">낮은가격순</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_price&amp;sortodr=desc">높은가격순</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_use_avg&amp;sortodr=desc">평점높은순</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_use_cnt&amp;sortodr=desc">후기많은순</option>
        <option value="/0b/shop/list.php?ca_id=10&amp;sort=it_update_time&amp;sortodr=desc">최근등록순</option>
    </select>
</section>
<!-- } 상품 정렬 선택 끝 -->
<!-- 상품진열 10 시작 { -->
<ul class="sct sct_10">
<li class="sct_li sct_clear" style="width:33%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
<img src="/resources/market/img/book_img2.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680362"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680362"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
임시상품
</a></div>
<div class="sct_cost">
9999999999원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
<div class="sct_cartop"></div>
</li>

<li class="sct_li" style="width:33%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
<img src="/resources/market/img/book_img3.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680300"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680300"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
임시상품
</a></div>
<div class="sct_cost">
9999999999원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
<div class="sct_cartop"></div>
</li>

<c:forEach items="${baseInfo}" var="baseInfo">
<li class="sct_li" style="width:33%;">
<div class="sct_img">
<a href="/market/item/itemReadPage?item_idx=${baseInfo.item_idx}" class="sct_a">
<c:choose>
<c:when test="${not empty baseInfo.item_photoName}">
	<img src="${baseInfo.item_photoName}" width="230" height="230" >
</c:when>
	<c:otherwise>
	<img src="/resources/market/img/noimg.jpg" width="230" height="230" >
	</c:otherwise>
</c:choose>

</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680362"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680362"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_txt_wr">
<div class="sct_txt"><a href="#" class="sct_a">
${baseInfo.item_title}
</a></div>
<div class="sct_cost">
${baseInfo.item_price}원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
<div class="sct_cartop"></div>
</li>
</c:forEach>
</ul>
<!-- } 상품진열 10 끝 -->

    
    <div id="sct_thtml"></div></div>

    </div>
<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/market/include/marketHeader.jsp" %>

<div id="container">
    <div id="container_wr">

    
    	

<section id="idx_wp_section" class="idx_section">
	<div class="idx_section_inner">
		
<div id="main_bn" class="swipe masonry">
<div class="bn_img">
<div class="item">
<img src="/resources/market/img/intelBanner.png" width="900" alt=""></div>
<div class="item">
<img src="/resources/market/img/bookBanner.jpg" width="900" alt=""></div>
</div>
</div>

<script>
$(document).ready(function() {
    $(".bn_img").owlCarousel({
        autoPlay : true,
        navigation : true, 
        pagination: true, 
        slideSpeed : 300,
        paginationSpeed : 400,
        singleItem:true,

        // "singleItem:true" is a shortcut for:
        // items : 1, 
        // itemsDesktop : false,
        // itemsDesktopSmall : false,
        // itemsTablet: false,
        // itemsMobile : false
    });
    
   
});
</script>

		
		<div id="idx_bn_right" class="shop-main">
			<div id="idx_coupon">
	            <h2><a href="#" class="unReady">쿠폰존</a></h2>
	            <a href="#" class="unReady">
	                <img src="http://witch01.dothome.co.kr/0b/theme/b/img/1.jpg" alt="이벤트">
	            </a>
	        </div>
		</div>
		<div id="idx_bn_right" class="shop-main">
			<div id="idx_coupon"><!-- idx_event_bn -->
	            <h2><a href="#" class="unReady">이벤트</a></h2>
	            <a href="#" class="unReady">
	                <img src="http://witch01.dothome.co.kr/0b/theme/b/img/2.jpg" alt="이벤트">
	            </a>
	        </div>
		</div>
	</div>
</section>

<section id="idx_hot" class="idx_section">
		<div class="idx_best">
	    <h2 class="con_tit"><a href="http://witch01.dothome.co.kr/0b/shop/listtype.php?type=4">인기상품</a></h2>
	    
<script src="http://witch01.dothome.co.kr/0b/js/jquery.fancylist.js"></script>

<!-- 상품진열 10 시작 { -->
<ul id="sct_wrap" class="sct sct_20">
<c:forEach items="${bastItem}" var="bastItem" varStatus="loop">

<c:if test="${loop.index eq 0}">
<li class="sct_li_${loop.index}">
<span class="sct_rank">0${loop.index}</span>
<div class="sct_txt">
<a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
${bastItem.item_name}
</a>

<div class="sct_cost">
${bastItem.item_price} 점
</div>
</div>


<div class="sct_img">
	<a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
		<c:choose>
			<c:when test="${empty bastItem.item_photoName}">
				<img src="/resources/market/img/noimg.jpg" width="230" height="230">
			</c:when>
			<c:otherwise>
				<img src="${bastItem.item_photoName}" width="230" height="230">
			</c:otherwise>
		</c:choose>
	</a>
</div>


</li>
</c:if>
<li class="sct_li_${loop.index + 1}">
<span class="sct_rank">0${loop.index + 1}</span>
<div class="sct_txt">
<a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
${bastItem.item_name}
</a>

<div class="sct_cost">
${bastItem.item_price} 점
</div>
</div>

<div class="sct_img">
	<a href="/market/item/itemReadPage?item_idx=${bastItem.item_idx}" class="sct_a">
		<c:choose>
			<c:when test="${empty bastItem.item_photoName}">
				<img src="/resources/market/img/noimg.jpg" width="230" height="230">
			</c:when>
			<c:otherwise>
				<img src="${bastItem.item_photoName}" width="230" height="230">
			</c:otherwise>
		</c:choose>
	</a>
</div>
</li>

</c:forEach>

</ul>
<!-- } 상품진열 10 끝 -->
	</div>
	</section>  
  <!-- 
<section id="idx_shop">
    <h2 class="con_tit"><span>SHOP</span></h2>
    <div id="sidx" class="tab-wr">
        <ul class="tabsTit">
            <li class="tabsTab tabsHover tab-first">히트상품</li>
            <li class="tabsTab">추천상품</li>
            <li class="tabsTab tab-last">할인상품</li>
        </ul>
        <ul class="tabsCon">
            <li class="tabsList" readonly="true">
                    -->           
<!-- 상품진열 10 시작 { -->
<!-- <ul class="sct sct_10">
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680362/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680362"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680362"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680358/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680358"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680358"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680353/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680353"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680353"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680300/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680300"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680300"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680296/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680296"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680296"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680293/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680293"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680293"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680287/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680287"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680287"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680252/thumb-p3_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680252"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680252"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
</ul> -->
<!-- } 상품진열 10 끝 -->
                            </li>
            <li class="tabsList">
                                
<!-- 상품진열 10 시작 { -->
<!-- 
<ul class="sct sct_10">
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680362/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680362"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680362"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680358/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680358"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680358"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680353/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680353"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680353"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680300/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680300"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680300"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680296/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680296"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680296"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680293/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680293"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680293"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680287/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680287"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680287"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680252/thumb-p3_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680252"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680252"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
</ul> -->
<!-- } 상품진열 10 끝 -->
                            </li>
            <li class="tabsList">
                                
<!-- 상품진열 10 시작 { -->
<!-- 
<ul class="sct sct_10">
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680362/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680362"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680362"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680362" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680358/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680358"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680358"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680358" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680353/thumb-p5_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680353"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680353"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680353" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680300/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680300"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680300"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680300" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li sct_clear" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680296/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680296"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680296"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680296" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680293/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680293"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680293"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680293" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680287/thumb-p4_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680287"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680287"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680287" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
<li class="sct_li" style="width:25%;">
<div class="sct_img">
<a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
<img src="http://witch01.dothome.co.kr/0b/data/item/1495680252/thumb-p3_230x230.jpg" width="230" height="230" alt="상품 B1">
</a>
<div class="sct_btn">
            <div class="sct_cart_btn">
                <button type="button" class="btn_cart" data-it_id="1495680252"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                <button type="button" class="btn_wish" data-it_id="1495680252"><i class="fa fa-heart" aria-hidden="true"></i></button>
            </div>
        </div>
</div>
<div class="sct_cont">
<div class="sct_txt_wr">
<div class="sct_txt"><a href="http://witch01.dothome.co.kr/0b/shop/item.php?it_id=1495680252" class="sct_a">
상품 B1
</a></div>
<div class="sct_cost">
0원
</div>
<div class="sct_icon_wr"><span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span></div>
</div>
</div>
<div class="sct_cartop"></div>
</li>
</ul> -->
<!-- } 상품진열 10 끝 -->
                            </li>
		</ul>
    </div>
    <script>
    $("#sidx").UblueTabs({
        eventType:"click" 
    });
    </script>
</section>


    </div>
    
<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>
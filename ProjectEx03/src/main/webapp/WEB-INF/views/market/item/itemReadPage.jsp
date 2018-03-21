<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/market/include/marketHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

.itemMiniImg{
	display: inline-block;
	width: 100px;
	height: 100px;
}
.itemMiniImg:first-child{
	border: 1px solid black;
}
</style>
<script>

var itemNum=0;

function itemImgChange(obj){
	$('.itemMiniImg:eq('+obj+')').css({'border' : '1px solid black'});
	var src = $('.itemMiniImg:eq('+obj+') a img').attr('src');
	
	$('#mainImg').attr('src',src);
	if(obj != itemNum){
		$('.itemMiniImg:eq('+itemNum+')').css({'border' : '0px'});
	}
	itemNum = obj;
}

$().ready(function() {
	
	var formObj = $('#itemForm');
	
	$('#sit_btn_cart').click(function() {
		
		$('#it_amount').attr("value", $('#base_amount').val());
		
		formObj.attr("method", "post");
		formObj.attr("action", "/market/cart/cartList");
		formObj.submit();
	});
	
	//가격계산기

    var sail = $('#it_sail').val();
    var price = $('#it_price').val();
    var sailPrice = Math.ceil(price*(sail/100));
    var result = price - sailPrice;
    $('#it_price').val(result);
    $('.it_sailprice').html(result+"점");
    
    $('.reviewView').click(function(event) {
    	event.preventDefault();
    	
    	var reviewViewTarget = $(this).attr('href');
    	if($('#'+reviewViewTarget).css('display')=='none'){
    		$('#'+reviewViewTarget).css({'display':'table-row'});
    	}else{
    		$('#'+reviewViewTarget).css({'display':'none'});
    	}
	});
    $('.inquriyView').click(function(event) {
    	event.preventDefault();
    	
    	var inquriyViewTarget = $(this).attr('href');
    	if($('#'+inquriyViewTarget).css('display')=='none'){
    		$('#'+inquriyViewTarget).css({'display':'table-row'});
    	}else{
    		$('#'+inquriyViewTarget).css({'display':'none'});
    	}
	});
});

</script>
<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">${baseInfo.item_name} &gt; ${baseInfo.item_area}</h1><div id="sit_hhtml"></div>
<script src="http://witch01.dothome.co.kr/0b/js/shop.js"></script>


<div id="sit">

    

<form id="itemForm" name="fitem">
<input type="hidden" name="it_id[]" value="1495680362">
<input type="hidden" name="sw_direct">
<input type="hidden" name="url">

<div id="sit_ov_wrap">
    <div id="sit_pvi">
<div id="sit_pvi_slide" >
<div class="item">
<c:choose>
<c:when test="${not empty baseInfo.files[0]}">
	<img id="mainImg" name="item_photoName" src="${baseInfo.files[0]}" width="400" height="400" >
	<ul>
	<c:forEach items="${baseInfo.files}" var="files" varStatus="loopStatus">
		
		<li class="itemMiniImg"><a href='javascript:itemImgChange(${loopStatus.index })'><img src="${files}"></a></li>
		
	</c:forEach>
	</ul>
</c:when>
	<c:otherwise>
	<img src="/resources/market/img/noimg.jpg" width="400" height="400" >
	</c:otherwise>
</c:choose>
</div>
</div>
</div>
<script>
$(document).ready(function() {
    $("#sit_pvi_slide").owlCarousel({
        autoPlay : false,
        navigation : true, // Show next and prev buttons
        slideSpeed : 500,
        pagination:false,
        singleItem:true,

    });
    
});


</script>
    <section id="sit_ov">
        <h2>상품간략정보 및 구매기능</h2>
        <div class="sit_icon_wr">
        <span class="sit_icon"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_hit.gif" alt="히트상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_rec.gif" alt="추천상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_new.gif" alt="최신상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_best.gif" alt="인기상품"><img src="http://witch01.dothome.co.kr/0b/theme/b/img/icon_discount.gif" alt="할인상품"></span>        </div>
        <strong id="sit_title">${baseInfo.item_title}</strong>
        <p id="sit_desc"></p>
                <p id="sit_opt_info">
            상품 선택옵션 0 개, 추가옵션 0 개
        </p>
        
        <div class="sit_ov_tbl">
            <table >
            <colgroup>
                <col class="grid_2">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <th scope="row">남은수량</th>
                <td>
                    ${baseInfo.item_amount}개</td>
            </tr>
            <tr>
                <th scope="row">할인율</th>
                <td>
                    ${baseInfo.item_sail}%
                </td>
            </tr>                                   
            <tr>
                <th scope="row">판매 포인트</th>
                <td>
                    <span style="text-decoration: line-through;">${baseInfo.item_price}점</span> &nbsp;&nbsp;&nbsp;
                    <span class="it_sailprice"></span>
                </td>
            </tr>
            <tr>
                <th>배송비결제</th>
                <td>주문시 결제</td>
            </tr>
            <tr>
                <th scope="row">판매자</th>
                <td>
                    ${baseInfo.item_sellerName}
                </td>
            </tr>
            </tbody>
            </table>
        </div>
        <div class="sit_opt_wr">
        
        
                <div id="sit_sel_option">
                    <ul id="sit_opt_added">
                <li class="sit_opt_list">
                	<input type="hidden" value="${baseInfo.item_idx}" name="item_idx">
                	<input type="hidden" id="it_sail" value="${baseInfo.item_sail}" name="item_sail">
                	<input type="hidden" id="it_price" value="${baseInfo.item_price}">
                	<input type="hidden" value="${baseInfo.item_price}" name="item_price">
                	<input type="hidden" value="${baseInfo.item_title}" name="item_title">
                	<input type="hidden" value="${baseInfo.item_name}" name="item_name">
                	<input type="hidden" id="it_amount" value="" name="item_amount">
                	<input type="hidden" value="${baseInfo.files[0]}" name="item_photoName">
                	<input type="hidden" value="${baseInfo.item_sellerId}" name="item_sellerId">
                	<input type="hidden" value="${baseInfo.item_sellerName}" name="item_sellerName">
                	
                    <input type="hidden" name="io_type[1495680362][]" value="0">
                    <input type="hidden" name="io_id[1495680362][]" value="">
                    <input type="hidden" name="io_value[1495680362][]" value="상품 B1">
                    <input type="hidden" class="io_price" value="0">
                    <input type="hidden" class="io_stock" value="99999">
                    <span class="sit_opt_subj">${baseInfo.item_name}</span>
                    <span class="sit_opt_prc">(+<span class="it_sailprice"></span>)</span>
                    <div class="sit_opt_qty">
                        <input type="text" id="base_amount" name="ct_qty[1495680362][]" value="1" class="frm_input" size="5">
                        
                        <button type="button" class="sit_qty_plus" style="color: aqua;">증가</button>
                        <button type="button" class="sit_qty_minus" style="color: aqua;">감소</button>
                    </div>
                </li>
            </ul>
            <script>
            $(function() {
                price_calculate();
            });
            </script>
                </div>

        <div id="sit_tot_price"></div>
            </div>
    
    <div class="sit_btn_wr">
        
        <div id="sit_ov_btn">
            <input type="button" value="장바구니" id="sit_btn_cart" style="width: 260px;">
            <input type="submit" onclick="document.pressed=this.value;" value="바로구매" id="sit_btn_buy" style="width: 260px;">
        </div>
    </div>
    </section>

	<div id="sit_star_sns">
        <div id="sit_star">
            
        </div>
        <div id="sit_sns">
            <a href="javascript:popup_item_recommend('1495680362');" id="sit_btn_rec"><i class="fa fa-envelope" aria-hidden="true"></i><span class="sound_only">추천하기</span></a>

            <a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwitch01.dothome.co.kr%2F0b%2Fshop%2Fitem.php%3Fit_id%3D1495680362&amp;p=%EC%83%81%ED%92%88+B1+%7C+%EC%87%BC%ED%95%91%EB%AA%B00B" class="share-facebook" target="_blank"><img src="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/img/sns_fb.png" alt="페이스북에 공유"></a>            <a href="https://twitter.com/share?url=http%3A%2F%2Fwitch01.dothome.co.kr%2F0b%2Fshop%2Fitem.php%3Fit_id%3D1495680362&amp;text=%EC%83%81%ED%92%88+B1+%7C+%EC%87%BC%ED%95%91%EB%AA%B00B" class="share-twitter" target="_blank"><img src="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/img/sns_twt.png" alt="트위터에 공유"></a>            <a href="https://plus.google.com/share?url=http%3A%2F%2Fwitch01.dothome.co.kr%2F0b%2Fshop%2Fitem.php%3Fit_id%3D1495680362" class="share-googleplus" target="_blank"><img src="http://witch01.dothome.co.kr/0b/theme/b/mobile/skin/shop/basic/img/sns_goo.png" alt="구글플러스에 공유"></a>                    </div>
    </div>
    
    
</div>

</form>


<!-- 상품 정보 시작 { -->
<section id="sit_inf">
    <h2 class="contents_tit"><span>상품 정보</span></h2><br>

	${baseInfo.item_contents}
     

        <h3>상품 정보 고시</h3>
    <table id="sit_inf_open">
    <colgroup>
        <col class="grid_4">
        <col>
    </colgroup>
    <tbody>
        <tr>
        <th scope="row">제품소재</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">색상</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">치수</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">제조자</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">세탁방법 및 취급시 주의사항</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">제조연월</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">품질보증기준</th>
        <td>상품페이지 참고상세정보 제품내 표기</td>
    </tr>
        <tr>
        <th scope="row">A/S 책임자와 전화번호</th>
        <td>상세정보 제품내 표기</td>
    </tr>
        </tbody>
    </table>
    <!-- 상품정보고시 end -->
    
</section>
<!-- } 상품 정보 끝 -->
    <div id="sit_tab" class="tab-wr">
        <ul class="tabsTit">
            <li class="tabsTab tabsHover tab-first">사용후기</li>
            <li class="tabsTab">상품문의</li>
            <li class="tabsTab tab-last">배송/교환정보</li>
        </ul>
        <ul class="tabsCon">
            <!-- 사용후기 시작 { -->
            <li id="sit_use"  class="tabsList">
                <h2>사용후기</h2>

                <div id="itemuse">
<script src="http://witch01.dothome.co.kr/0b/js/viewimageresize.js"></script>

<!-- 상품 사용후기 시작 { -->
<div id="sit_use_list">
	<c:choose>
		<c:when test="${empty itemReview}">
			<p class="sit_empty">사용후기가 없습니다.</p>
		</c:when>
		<c:otherwise>
		
<table class="table table-hover">
        <thead class="thead-inverse">
        <tr>
            <th scope="col" style="text-align:center; vertical-align: middle;">상품평점</th>
            <th style="text-align:center; vertical-align: middle;">리뷰제목</th>
            <th style="text-align:center; vertical-align: middle;">작성일</th>
			<th style="text-align:center; vertical-align: middle;">작성자</th>
        </tr>
        </thead>
        <tbody id="list">
			<c:forEach items="${itemReview}" var="itemReview">
				<tr>
					<c:choose>
						<c:when test="${itemReview.review_score eq 5}">
							<td style="text-align:center; vertical-align: middle;">
								<label for="is_score10">매우만족</label>
                      			<img src="http://witch01.dothome.co.kr/0b/shop/img/s_star5.png">
							</td>
						</c:when>
						<c:when test="${itemReview.review_score eq 4}">
							<td style="text-align:center; vertical-align: middle;">
								<label for="is_score8">만족</label>
                   			     <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star4.png">
							</td>
						</c:when>
						<c:when test="${itemReview.review_score eq 3}">
							<td style="text-align:center; vertical-align: middle;">
								<label for="is_score6">보통</label>
                    		    <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star3.png">
							</td>
						</c:when>
						<c:when test="${itemReview.review_score eq 2}">
							<td style="text-align:center; vertical-align: middle;">
								<label for="is_score4">불만</label>
                      			  <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star2.png">
							</td>
						</c:when>
						<c:when test="${itemReview.review_score eq 1}">
							<td style="text-align:center; vertical-align: middle;">
								<label for="is_score2">매우불만</label>
                       			 <img src="http://witch01.dothome.co.kr/0b/shop/img/s_star1.png">
							</td>
						</c:when>
					</c:choose>
					<td style="text-align:center; vertical-align: middle;"><a href='review_${itemReview.review_idx}' class="reviewView">${itemReview.review_title}</a></td>
					<td style="text-align:center; vertical-align: middle;">${itemReview.review_regdate}</td>
					<td style="text-align:center; vertical-align: middle;">${itemReview.user_id}</td>
				</tr>
				<tr style="display: none; border: 1px solid black; height: 200px;" id="review_${itemReview.review_idx}">
					<td style="vertical-align: middle;">리뷰 내용</td>
					<td colspan="3" style="vertical-align: middle;">${itemReview.review_contents}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
		</c:otherwise>
	</c:choose>
</div>
	

<div id="sit_use_wbtn">
    <a href="/market/item/itemReviewPopUp?item_idx=${baseInfo.item_idx}" class="qa_wr itemuse_form " onclick="return false;">후기작성<span class="sound_only"> 새 창</span></a>
    <a href="#" id="itemuse_list" class="btn01">더보기</a>
</div>

<script>
$(function(){
    $(".itemuse_form").click(function(){
        window.open(this.href, "itemuse_form", "width=810,height=680,scrollbars=1");
        return false;
    });

    $(".itemuse_delete").click(function(){
        if (confirm("정말 삭제 하시겠습니까?\n\n삭제후에는 되돌릴수 없습니다.")) {
            return true;
        } else {
            return false;
        }
    });

    $(".show-more").click(function(){
        var $con = $(this).siblings(".sit_use_con");
        if($con.is(":visible")) {
            $con.slideUp();
        } else {
            $(".sit_use_con:visible").hide();
            $con.slideDown(
                function() {
                    // 이미지 리사이즈
                    $con.viewimageresize2();
                }
            );
        }
    });

    $(".pg_page").click(function(){
        $("#itemuse").load($(this).attr("href"));
        return false;
    });

    $("a#itemuse_list").on("click", function() {
        window.opener.location.href = this.href;
        self.close();
        return false;
    });
});
</script>
<!-- } 상품 사용후기 끝 --></div>
            </li>
            <!-- } 사용후기 끝 -->

            <!-- 상품문의 시작 { -->
            <li id="sit_qa"  class="tabsList">
                <h2>상품문의</h2>

                <div id="itemqa">
<script src="http://witch01.dothome.co.kr/0b/js/viewimageresize.js"></script>

<!-- 상품문의 목록 시작 { -->
<div id="sit_qa_list">
    <c:choose>
		<c:when test="${empty itemInquriy}">
			<p class="sit_empty">상품문의가 없습니다.</p>
		</c:when>
		<c:otherwise>
		
<table class="table table-hover">
        <thead class="thead-inverse">
        <tr>
        	<th style="text-align:center; vertical-align: middle;">번호</th>
            <th scope="col" style="text-align:center; vertical-align: middle;">답변상태</th>
            <th style="text-align:center; vertical-align: middle;">문의유형</th>
            <th style="text-align:center; vertical-align: middle;">문의제목</th>
			<th style="text-align:center; vertical-align: middle;">작성자</th>
			<th style="text-align:center; vertical-align: middle;">작성일자</th>
        </tr>
        </thead>
        <tbody id="list">
			<c:forEach items="${itemInquriy}" var="itemInquriy">
				<tr>
					<td style="text-align:center; vertical-align: middle;">${itemInquriy.inquiry_idx}</td>
					<c:choose>
						<c:when test="${itemInquriy.inquiry_state eq 'N'}">
							<td style="text-align:center; vertical-align: middle; color: gray;">미답변</td>
						</c:when>
						<c:otherwise>
							<td style="text-align:center; vertical-align: middle; color: green;">답변완료</td>
						</c:otherwise>
					</c:choose>
					<td style="text-align:center; vertical-align: middle;">${itemInquriy.inquiry_type}</td>
					<td style="text-align:center; vertical-align: middle;"><a href='inquriy_${itemInquriy.inquiry_idx}' class="inquriyView">${itemInquriy.inquiry_title}</a></td>
					<td style="text-align:center; vertical-align: middle;">${itemInquriy.user_id}</td>
					<td style="text-align:center; vertical-align: middle;">${itemInquriy.inquiry_regdate}</td>
				</tr>
				<tr style="display: none; border: 1px solid black; height: 200px;" id="inquriy_${itemInquriy.inquiry_idx}">
					<td style="vertical-align: middle;">문의 내용</td>
					<td colspan="5" style="vertical-align: middle;">${itemInquriy.inquiry_contents}</td>
				</tr>
			</c:forEach>
		</tbody>
</table>
		</c:otherwise>
	</c:choose>
</div>


<div id="sit_qa_wbtn">
    <a href="/market/item/itemInquiryPopUp?item_idx=${baseInfo.item_idx}" class="itemqa_form qa_wr">문의작성<span class="sound_only"> 새 창</span></a>
    <a href="#" id="itemqa_list" class="btn01">더보기</a>
</div>

<script>
$(function(){
    $(".itemqa_form").click(function(){
        window.open(this.href, "itemqa_form", "width=810,height=680,scrollbars=1");
        return false;
    });

    $(".itemqa_delete").click(function(){
        return confirm("정말 삭제 하시겠습니까?\n\n삭제후에는 되돌릴수 없습니다.");
    });

    $(".show-more").click(function(){
        var $con = $(this).siblings(".sit_qa_con");
        if($con.is(":visible")) {
            $con.slideUp();
        } else {
            $(".sit_qa_con:visible").hide();
            $con.slideDown(
                function() {
                    // 이미지 리사이즈
                    $con.viewimageresize2();
                }
            );
        }
    });

    $(".qa_page").click(function(){
        $("#itemqa").load($(this).attr("href"));
        return false;
    });

    $("a#itemqa_list").on("click", function() {
        window.opener.location.href = this.href;
        self.close();
        return false;
    });
});
</script>
<!-- } 상품문의 목록 끝 --></div>
            </li>
            <!-- } 상품문의 끝 -->

                        <!-- 배송정보 시작 { -->
            <li id="sit_dvex"  class="tabsList">
                <h2>배송/교환정보</h2>
                <div id="sit_dvr">
                    <h3>배송정보</h3>

                    배송 안내 입력전입니다.                </div>
                <!-- } 배송정보 끝 -->
                

                                <!-- 교환/반품 시작 { -->
                <div id="sit_ex" >
                    <h3>교환/반품</h3>

                    교환/반품 안내 입력전입니다.                </div>
                <!-- } 교환/반품 끝 -->
                            </li>
        </ul>
    </div>

<!-- 관련상품 시작 { -->
<section id="sit_rel">
    <h2>관련상품</h2>
    
<script src="http://witch01.dothome.co.kr/0b/js/jquery.fancylist.js"></script>

<!-- 상품진열 10 시작 { -->
<p class="sct_noitem">등록된 관련상품이 없습니다.</p>
<script>
$(document).ready(function() {
    $("#sct_relitem").owlCarousel({
        items : 6,
        itemsDesktop : [1199,6],
        itemsDesktopSmall : [971,5],
        itemsTablet: [640,3],
        itemsMobile: [320,2],
        pagination:false,
        navigation : true,
    });
});
</script>
<!-- } 상품진열 10 끝 -->
</section>
<!-- } 관련상품 끝 -->

<script>
$("#sit_tab").UblueTabs({
    eventType:"click"
});

$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        document.location.reload();
    }
});

$(function(){
    // 상품이미지 슬라이드


    // 상품이미지 크게보기
    $(".popup_item_image").click(function() {
        var url = $(this).attr("href");
        var top = 10;
        var left = 10;
        var opt = 'scrollbars=yes,top='+top+',left='+left;
        popup_window(url, "largeimage", opt);

        return false;
    });
});

// 상품보관
function item_wish(f, it_id)
{
    f.url.value = "http://witch01.dothome.co.kr/0b/shop/wishupdate.php?it_id="+it_id;
    f.action = "http://witch01.dothome.co.kr/0b/shop/wishupdate.php";
    f.submit();
}

// 추천메일
function popup_item_recommend(it_id)
{
    if (!g5_is_member)
    {
        if (confirm("회원만 추천하실 수 있습니다."))
            document.location.href = "http://witch01.dothome.co.kr/0b/bbs/login.php?url=http%3A%2F%2Fwitch01.dothome.co.kr%2F0b%2Fshop%2Fitem.php%3Fit_id%3D1495680362";
    }
    else
    {
        url = "http://witch01.dothome.co.kr/0b/shop/itemrecommend.php?it_id=" + it_id;
        opt = "scrollbars=yes,width=616,height=420,top=10,left=10";
        popup_window(url, "itemrecommend", opt);
    }
}

// 재입고SMS 알림
function popup_stocksms(it_id)
{
    url = "http://witch01.dothome.co.kr/0b/shop/itemstocksms.php?it_id=" + it_id;
    opt = "scrollbars=yes,width=616,height=420,top=10,left=10";
    popup_window(url, "itemstocksms", opt);
}

function fsubmit_check(f)
{
    // 판매가격이 0 보다 작다면
    if (document.getElementById("it_price").value < 0) {
        alert("전화로 문의해 주시면 감사하겠습니다.");
        return false;
    }

    if($(".sit_opt_list").size() < 1) {
        alert("상품의 선택옵션을 선택해 주십시오.");
        return false;
    }

    var val, io_type, result = true;
    var sum_qty = 0;
    var min_qty = parseInt(1);
    var max_qty = parseInt(0);
    var $el_type = $("input[name^=io_type]");

    $("input[name^=ct_qty]").each(function(index) {
        val = $(this).val();

        if(val.length < 1) {
            alert("수량을 입력해 주십시오.");
            result = false;
            return false;
        }

        if(val.replace(/[0-9]/g, "").length > 0) {
            alert("수량은 숫자로 입력해 주십시오.");
            result = false;
            return false;
        }

        if(parseInt(val.replace(/[^0-9]/g, "")) < 1) {
            alert("수량은 1이상 입력해 주십시오.");
            result = false;
            return false;
        }

        io_type = $el_type.eq(index).val();
        if(io_type == "0")
            sum_qty += parseInt(val);
    });

    if(!result) {
        return false;
    }

    if(min_qty > 0 && sum_qty < min_qty) {
        alert("선택옵션 개수 총합 "+number_format(String(min_qty))+"개 이상 주문해 주십시오.");
        return false;
    }

    if(max_qty > 0 && sum_qty > max_qty) {
        alert("선택옵션 개수 총합 "+number_format(String(max_qty))+"개 이하로 주문해 주십시오.");
        return false;
    }

    return true;
}

// 바로구매, 장바구니 폼 전송
function fitem_submit(f)
{
    f.action = "http://witch01.dothome.co.kr/0b/shop/cartupdate.php";
    f.target = "";

    if (document.pressed == "장바구니") {
        f.sw_direct.value = 0;
    } else { // 바로구매
        f.sw_direct.value = 1;
    }

    // 판매가격이 0 보다 작다면
    if (document.getElementById("it_price").value < 0) {
        alert("전화로 문의해 주시면 감사하겠습니다.");
        return false;
    }

    if($(".sit_opt_list").size() < 1) {
        alert("상품의 선택옵션을 선택해 주십시오.");
        return false;
    }

    var val, io_type, result = true;
    var sum_qty = 0;
    var min_qty = parseInt(1);
    var max_qty = parseInt(0);
    var $el_type = $("input[name^=io_type]");

    $("input[name^=ct_qty]").each(function(index) {
        val = $(this).val();

        if(val.length < 1) {
            alert("수량을 입력해 주십시오.");
            result = false;
            return false;
        }

        if(val.replace(/[0-9]/g, "").length > 0) {
            alert("수량은 숫자로 입력해 주십시오.");
            result = false;
            return false;
        }

        if(parseInt(val.replace(/[^0-9]/g, "")) < 1) {
            alert("수량은 1이상 입력해 주십시오.");
            result = false;
            return false;
        }

        io_type = $el_type.eq(index).val();
        if(io_type == "0")
            sum_qty += parseInt(val);
    });

    if(!result) {
        return false;
    }

    if(min_qty > 0 && sum_qty < min_qty) {
        alert("선택옵션 개수 총합 "+number_format(String(min_qty))+"개 이상 주문해 주십시오.");
        return false;
    }

    if(max_qty > 0 && sum_qty > max_qty) {
        alert("선택옵션 개수 총합 "+number_format(String(max_qty))+"개 이하로 주문해 주십시오.");
        return false;
    }

    return true;
}
</script>
</div>

    </div>
    
<%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>

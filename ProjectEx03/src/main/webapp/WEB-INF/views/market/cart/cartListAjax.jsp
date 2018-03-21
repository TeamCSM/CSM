<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 장바구니 간략 보기 시작 { -->
      <script>
      	var count = 0;
      	
      	$().ready(function() {
			$('.cart_del').click(function() {
				
				var target = $(this).val();
				var item_idx = $("#"+target +" #item_idx").val();
				
				$.ajax({
        			url : "/market/cart/cartQuickDelete",
        			type : "post",
        			dataType : "text",
        			data : {item_idx : item_idx},
        			success : function(data){
        				
        				$("#"+target).fadeOut(500);		
        			}
        		});
			});
		});
      </script>
      <form name="frmcartlist" method="post" action="/market/order/orderform">
			    <input type="hidden" name="act" value="buy">
			
			    <ul class="nav_cart qk_prdli">
			    
			  		<c:choose>
			  		<c:when test="${not empty cartItemInfoAjax}">
			  			<c:forEach items="${cartItemInfoAjax}" var="cartItemInfoAjax" varStatus="loop">
			  			<script>
			  			count++;
			  			</script>
			    		<li id="quickCart_${loop.index}">
				    		<c:choose>
								<c:when test="${not empty cartItemInfoAjax.item_photoName}">
									<div class="cart_img qk_img"><a href="/market/item/itemReadPage?item_idx=${cartItemInfoAjax.item_idx}"><img src="${cartItemInfoAjax.item_photoName}" width="80" height="80" alt=""></a></div>
								</c:when>
								<c:otherwise>
									<div class="cart_img qk_img"><a href="/market/item/itemReadPage?item_idx=${cartItemInfoAjax.item_idx}"><img src="/resources/market/img/noimg.jpg" width="80" height="80" alt=""></a></div>
								</c:otherwise>
							</c:choose>
							
							<div class="qk_txt">
							<input type="hidden" name="it_id[0]" value="1495680362">
							<input type="hidden" name="it_name[0]" value="상품 B1">
							<input type="hidden" id="item_idx" name="orderItems[${loop.index}].item_idx" value="${cartItemInfoAjax.item_idx}"/>
							<input type="hidden" name="orderItems[${loop.index}].item_check" value="1">
							<label for="ct_chk_0" class="sound_only">${cartItemInfoAjax.item_title} 선택</label>
							<span class="sound_only"><input type="checkbox" name="ct_chk[0]" value="1" id="ct_chk_0" checked="checked" class="sound_only"></span>
							<a href="/market/item/itemReadPage?item_idx=${cartItemInfoAjax.item_idx}" class="qk_name">${cartItemInfoAjax.item_name}</a>
							<div class="cart_op qk_opt">${cartItemInfoAjax.item_sail}% 할인<br />
							<span class="sound_only">수량</span> (${cartItemInfoAjax.item_amount}개)</div>
							<div class="qk_prc"><span style="color: red; text-decoration: line-through;">${cartItemInfoAjax.item_price}</span>| ${cartItemInfoAjax.item_priceResult}점</div>
							</div>
							<button class="cart_del prd_del" type="button" data-it_id="1495680362" value="quickCart_${loop.index}"><i class="fa fa-times" aria-hidden="true"></i><span class="sound_only">삭제</span></button>
						</li>
						</c:forEach>
			    	</c:when>
			    	<c:otherwise>
			    		<li class="empty_list">장바구니 상품 없음</li>
			    	</c:otherwise>
			  </c:choose>
			    </ul>
			    <c:choose>
			  		<c:when test="${not empty cartItemInfoAjax}">
			    <div class="cart_al">총 합계  <strong>${item_totalPriceAjax} 원</strong></div>
			    <div class="cart_btn qk_cart_btn">
			        <a href="/market/cart/cartList" class="qk_go_cart">장바구니 가기</a>
			        <button type="submit" class="qk_go_buy">주문하기</button>
			    </div>
			    	</c:when>
			    	<c:otherwise>
			    	</c:otherwise>
			    </c:choose>
			<script type="text/javascript">
				$("#cart-count").html(count);
			</script>
	    </form>
    <!-- } 장바구니 간략 보기 끝 -->
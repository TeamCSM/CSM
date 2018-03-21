<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>

<script>


$().ready(function() {
	
	var formObj = $('#sod_bsk_list');
	
	$("#orderBtn").click(function() {
				
		formObj.attr("method", "post");
		formObj.attr("action", "/market/order/orderform");
		formObj.submit();
		
	});
	$('#cartDelete').click(function() {
		
		formObj.attr("method", "post");
		formObj.attr("action", "/market/cart/cartDelete");
		formObj.submit();
			
	});
	$('#cartClean').click(function() {
		location.href = '/market/cart/cartClean';
	});
	
	//전체 체크박스 값 변경시 이벤트
	$("#ct_all").on("change", function() {
	      $(".item_checkd").prop("checked", $(this).prop("checked"));
	      
	      if($('#ct_all:checked').val() == 1){
	    	  $(".item_checkd").val(1);
	      }else{
	    	  $(".item_checkd").val(0);
	      }
	     
	})

	//체크박스 개별로 하나씩 체크를 할때 전체 체크를 하게 되면 all체크박스 checked 상태 변경
	$(".item_checkd").on("change",function(){
		 
		if($(this).val() == 1){
			$(this).val(0);
		}else{
			$(this).val(1);
		}
		
		if($(".item_checkd:not(:checked)").length == 0){
	             $("#ct_all").prop("checked", true);
	            
	       }else{
	             $("#ct_all").prop("checked", false);
	          
	      }
	       
	});
	
	$('.amountModifyBtn').click(function() {
		
		formObj.attr("method", "post");
		formObj.attr("action", "/market/cart/cartAmountChange");
		formObj.submit();
	});
});
</script>

<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">장바구니</h1>
<script src="http://witch01.dothome.co.kr/0b/js/shop.js"></script>

<div id="sod_bsk">

	<c:choose>
	<c:when test="${not empty cartItemInfo}">
	
    <form name="frmcartlist" id="sod_bsk_list" method="post">
	
        <div id="sod_chk">
        <label for="ct_all" class="sound_only">상품 전체</label>
        <input type="checkbox" name="ct_all" value="1" id="ct_all" checked>
        전체상품 선택
    </div>
    
    <ul class="sod_list">
        <c:forEach items="${cartItemInfo}" var="itemInfo" varStatus="loop">
        <li class="sod_li">
        	<input type="hidden" id="item_idx" name="orderItems[${loop.index}].item_idx" value="${itemInfo.item_idx}"/>
                        
            <input type="hidden" name="it_id[0]"    value="1495680353">
            <input type="hidden" name="it_name[0]"  value="상품 B1">
            <div class="li_chk">
                <label for="ct_chk_0" class="sound_only">상품선택</label>
                <input type="checkbox" class="item_checkd" name="orderItems[${loop.index}].item_check" value="1" id="ct_chk_0" checked>
                <%-- <input type="checkbox" name="ct_chk[0]" value="${itemInfo.item_idx}" id="ct_chk_0" checked> --%>
            </div>
            <div class="li_name">
                <a href="/market/item/itemReadPage?item_idx=${itemInfo.item_idx}"><strong>${itemInfo.item_title}</strong></a>
            	<div class="sod_opt">
            		<ul>
            			<li>상품명 : ${itemInfo.item_name} </li>
						<li>
							<div class="li_mod" >
							수량 : <input type="text" name="orderItems[${loop.index}].item_amount" value="${itemInfo.item_amount}" style="width: 30px;"/>개  
							<button type="button" class="mod_btn amountModifyBtn">변경</button> 
							</div>
						</li>
						<li>포인트 : ${itemInfo.item_price} 점</li>
						<li>판매자 : ${itemInfo.item_sellerName}</li>
					</ul>
				</div>                
				<span class="total_img">
					<c:choose>
						<c:when test="${not empty itemInfo.item_photoName}">
							<img src="${itemInfo.item_photoName}" width="80" height="80" alt="">
						</c:when>
						<c:otherwise>
							<img src="/resources/market/img/noimg.jpg" width="80" height="80" alt="">
						</c:otherwise>
					</c:choose>
				</span>
            </div>
            <div class="li_prqty">
	          	<span class="prqty_price li_prqty_sp"><span>할인 포인트</span><i style="color: red;">-${itemInfo.item_sail}</i> 점</span>
	          	<span class="prqty_qty li_prqty_sp"><span>할인 적용 포인트 </span><i>${itemInfo.item_priceResult}</i> 점</span>
                <span class="prqty_sc li_prqty_sp"><span>수량  </span><i>${itemInfo.item_amount}</i> 개</span>
            </div>

        </li>
		</c:forEach>
            </ul>

        <dl id="sod_bsk_tot">
                <dt class="sod_bsk_dvr">배송비</dt>
        <dd class="sod_bsk_dvr"><strong>무료 배송</strong></dd>
        
                <dt class="sod_bsk_cnt">총계</dt>
        <dd class="sod_bsk_cnt"><strong id="buy_price">${item_totalPrice} 점</strong></dd>
        
            </dl>
    
    <div id="sod_bsk_act" class="btn_confirm">
        <input type="hidden" name="url" value="http://witch01.dothome.co.kr/0b/shop/orderform.php">
        <input type="hidden" name="act" value="">
        <input type="hidden" name="records" value="1">
        <a href="/market/marketHome" class="btn01">쇼핑 계속하기</a>
        <button type="button" id="orderBtn" class="btn_submit">주문하기</button>
        <div><button type="button" id="cartDelete" class="btn01">선택삭제</button>
        <button type="button" id="cartClean" class="btn01">비우기</button></div>
   	</div>

    </form>
    </c:when>
    <c:otherwise>
	    <form name="frmcartlist" id="sod_bsk_list" method="post" action="http://witch01.dothome.co.kr/0b/shop/cartupdate.php">
	
	    
	    <ul class="sod_list">
	        <li class="empty_list">장바구니에 담긴 상품이 없습니다.</li>    </ul>
	
	    
	    <div id="sod_bsk_act" class="btn_confirm">
	                <a href="/market/marketHome" class="btn01">쇼핑 계속하기</a>
	            </div>
	
	    </form>
    </c:otherwise>
	</c:choose>
</div>

<script>
$(function() {
    var close_btn_idx;

    // 선택사항수정
    $(".mod_options").click(function() {
        var it_id = $(this).attr("id").replace("mod_opt_", "");
        var $this = $(this);
        close_btn_idx = $(".mod_options").index($(this));

        $.post(
            "./cartoption.php",
            { it_id: it_id },
            function(data) {
                $("#mod_option_frm").remove();
                $this.after("<div id=\"mod_option_frm\"></div>");
                $("#mod_option_frm").html(data);
                price_calculate();
            }
        );
    });

    // 모두선택
    $("input[name=ct_all]").click(function() {
        if($(this).is(":checked"))
            $("input[name^=ct_chk]").attr("checked", true);
        else
            $("input[name^=ct_chk]").attr("checked", false);
    });

    // 옵션수정 닫기
    $(document).on("click", "#mod_option_close", function() {
        $("#mod_option_frm").remove();
        $("#win_mask, .window").hide();
        $(".mod_options").eq(close_btn_idx).focus();
    });
    $("#win_mask").click(function () {
        $("#mod_option_frm").remove();
        $("#win_mask").hide();
        $(".mod_options").eq(close_btn_idx).focus();
    });

});

function fsubmit_check(f) {
    if($("input[name^=ct_chk]:checked").size() < 1) {
        alert("구매하실 상품을 하나이상 선택해 주십시오.");
        return false;
    }

    return true;
}

function form_check(act) {
    var f = document.frmcartlist;
    var cnt = f.records.value;

    if (act == "buy")
    {
        f.act.value = act;
        f.submit();
    }
    else if (act == "alldelete")
    {
        f.act.value = act;
        f.submit();
    }
    else if (act == "seldelete")
    {
        if($("input[name^=ct_chk]:checked").size() < 1) {
            alert("삭제하실 상품을 하나이상 선택해 주십시오.");
            return false;
        }

        f.act.value = act;
        f.submit();
    }

    return true;
}
</script>

    </div>
    
<%@ include file="/resources/market/include/quickMenu.jsp" %>
    
</div><!-- container End -->

<%@ include file="/resources/market/include/marketFutter.jsp" %>

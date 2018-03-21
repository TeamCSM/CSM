<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>



<script>
$().ready(function() {
	
	if('${orderBaseInfo.order_progress}'=='상품준비중'){
		
		$('#sod_fin_legend dt:nth-child(1)').css({'color':'red'});
		$('#sod_fin_legend dd:nth-child(2)').css({'color':'red'});
	}else if('${orderBaseInfo.order_progress}'=='상품배송중'){
		
		$('#sod_fin_legend dt:nth-child(3)').css({'color':'red'});
		$('#sod_fin_legend dd:nth-child(4)').css({'color':'red'});
	}else if('${orderBaseInfo.order_progress}'=='배송완료'){
		
		$('#sod_fin_legend dt:nth-child(5)').css({'color':'red'});
		$('#sod_fin_legend dd:nth-child(6)').css({'color':'red'});
		
		$('#sod_fin_cancel').css({'display':'none'});
	}else if('${orderBaseInfo.order_progress}'=='주문취소'){
		$('#sod_fin_legend dt:nth-child(7)').css({'color':'red'});
		$('#sod_fin_legend dd:nth-child(8)').css({'color':'red'});
		
		$('#sod_fin_cancel').css({'display':'none'});
	};
	
	$('#itemBuyBtn').click(function() {
		
		var buy = confirm("상품이 정상적으로 수취되었음에 동의합니까?");
		if(buy){
			var formObj = $("#orderItems");
			formObj.submit();
		}
	});
	
});

</script>

<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">주문상세내역</h1>
<div id="sod_fin">

    <div id="sod_fin_no">주문번호 <strong>${orderBaseInfo.order_idx}</strong></div>

    
        <h2>주문하신 상품</h2>
			<form id="orderItems" action="/market/order/orderProgressComplete" method="post">
				
                <ul id="sod_list_inq" class="sod_list">
                	<c:forEach items="${orderItemInfo}" var="orderItemInfo" varStatus="loop">
                    	<li class="sod_li">
                     <input type="hidden" id="item_idx" name="orderItems[${loop.index}].item_idx" value="${orderItemInfo.item_idx}"/>
                     <input type="hidden"  name="orderItems[${loop.index}].order_progress" value="배송완료"/>
                     <input type="hidden"  name="orderItems[${loop.index}].item_name" value="${orderItemInfo.item_name}"/>
                     <input type="hidden"  name="orderItems[${loop.index}].item_price" value="${orderItemInfo.item_price}"/>
                     <input type="hidden"  name="orderItems[${loop.index}].item_amount" value="${orderItemInfo.item_amount}"/>
                     <input type="hidden"  name="orderItems[${loop.index}].item_sellerId" value="${orderItemInfo.item_sellerId}"/>
                     <input type="hidden"  name="orderItems[${loop.index}].item_photoName" value="${orderItemInfo.item_photoName}"/>
                     <input type="hidden"  name="order_progress" value="배송완료"/>
                     <input type="hidden"  name="order_idx" value="${orderItemInfo.order_idx}"/>
                <div class="li_name_od">
                    <a href="/market/item/itemReadPage?item_idx=${orderItemInfo.item_idx}"><strong>${orderItemInfo.item_title}</strong></a>
                </div>
                            <div class="li_opt">${orderItemInfo.item_name}</div>
                <div class="li_prqty">
                    <span class="prqty_price li_prqty_sp"><span>판매 포인트 </span>${orderItemInfo.item_price}</span>
                    <span class="prqty_qty li_prqty_sp"><span>수량 </span>${orderItemInfo.item_amount}</span>
                    <span class="prqty_sc li_prqty_sp"><span>배송비 </span>무료</span>
                    <span class="prqty_stat li_prqty_sp"><span>상태 </span>${orderItemInfo.order_progress}</span>
                </div>
                <div class="li_total" style="padding-left:60px;height:auto !important;height:70px;min-height:70px">
                    <a href="/market/item/itemReadPage?item_idx=${orderItemInfo.item_idx}" class="total_img">
                    	<c:choose>
						<c:when test="${not empty orderItemInfo.item_photoName}">
							<img src="${orderItemInfo.item_photoName}" width="50" height="50" alt="">
						</c:when>
						<c:otherwise>
							<img src="/resources/market/img/noimg.jpg" width="50" height="50" alt="">
						</c:otherwise>
					</c:choose>
                    	
                    </a>
                    <span class="total_price total_span"><span>할인적용된 포인트 </span>${orderItemInfo.item_priceResult}점</span>
                </div>
            
            </li>
            </c:forEach>
                    </ul>
			</form>
        <div id="sod_sts_wrap">
            <span class="sound_only">상품 상태 설명</span>
            <button type="button" id="sod_sts_explan_open" class="btn_frmline">상태설명보기</button>
            <div id="sod_sts_explan">
                <dl id="sod_fin_legend">
                    <dt>준비</dt>
                    <dd>상품 준비 중입니다.</dd>
                    <dt>배송</dt>
                    <dd>상품 배송 중입니다.</dd>
                    <dt>완료</dt>
                    <dd>상품 배송이 완료 되었습니다.</dd>
                    <dt>취소</dt>
                    <dd>상품을 취소하였습니다.</dd>
                </dl>
                <button type="button" id="sod_sts_explan_close" class="btn_frmline">상태설명닫기</button>
            </div>
        </div>

        
        <dl id="sod_bsk_tot">
            <dt class="sod_bsk_dvr">배송비</dt>
            <dd class="sod_bsk_dvr"><strong>무료</strong></dd>
            <dt class="sod_bsk_cnt">총계</dt>
            <dd class="sod_bsk_cnt"><strong>${orderBaseInfo.item_totalPrice}점</strong></dd>
        </dl>
    

    <div id="sod_fin_view">
        <h2>결제/배송 정보</h2>
        
        
            <h3>결제정보</h3>

            <div  class="odf_tbl">
                <table>
                <colgroup>
                    <col class="grid_2">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">주문번호</th>
                    <td>${orderBaseInfo.order_idx}</td>
                </tr>
                <tr>
                    <th scope="row">주문일시</th>
                    <td>${orderBaseInfo.order_regdate}</td>
                </tr>
                <tr>
                    <th scope="row">결제방식</th>
                    <td>포인트 결제</td>
                </tr>
                </tbody>
                </table>
            </div>

        
            <h3>주문하신 분</h3>

            <div  class="odf_tbl">
                <table>
                <colgroup>
                    <col class="grid_2">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">이 름</th>
                    <td>${userInfo.user_name }</td>
                </tr>
                <tr>
                    <th scope="row">전화번호</th>
                    <td>${userInfo.user_phone }</td>
                </tr>
                <tr>
                    <th scope="row">주 소</th>
                    <td>(${userInfo.user_mailNumber }) ${userInfo.user_streetAddr }, ${userInfo.user_detailedAddr }</td>
                </tr>
                </tbody>
                </table>
            </div>

        

        
            <h3>받으시는 분</h3>

            <div  class="odf_tbl">
                <table>
                <colgroup>
                    <col class="grid_2">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">이 름</th>
                    <td>${orderAddrInfo.user_name }</td>
                </tr>
                <tr>
                    <th scope="row">전화번호</th>
                    <td>${orderAddrInfo.user_phone }</td>
                </tr>
                <tr>
                    <th scope="row">주 소</th>
                    <td>(${orderAddrInfo.user_mailNumber }) ${orderAddrInfo.user_streetAddr }, ${orderAddrInfo.user_detailedAddr }</td>
                </tr>
                </tbody>
                </table>
            </div>
        

        
            <h3>배송정보</h3>

            <div  class="odf_tbl">
                <table>
                <colgroup>
                    <col class="grid_2">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <td class="empty_table" colspan="2">아직 배송하지 않았거나 배송정보를 입력하지 못하였습니다.</td>
                </tr>
                </tbody>
                </table>
            </div>
        
    </div>
	
   <dl id="sod_bsk_tot">
            <dt class="sod_bsk_cnt">배송비</dt>
            <dd class="sod_bsk_cnt"><strong>무료</strong></dd>
            <dt class="sod_bsk_dvr">총계</dt>
            <dd class="sod_bsk_dvr"><strong>${orderBaseInfo.item_totalPrice}점</strong></dd>
        </dl>
	
    <section id="sod_fin_cancel">
    	<c:choose>
	    	<c:when test="${orderBaseInfo.order_progress eq '배송완료'}">
	    		
	    	</c:when>
	    	<c:otherwise>
		        <c:if test="${orderBaseInfo.order_progress eq '상품배송중'}">
		        <button type="button" id="itemBuyBtn">수취 확인하기</button>
		        </c:if>
		        <h2>주문취소</h2>
		        <button type="button" onclick="document.getElementById('sod_fin_cancelfrm').style.display='block';">주문 취소하기</button>
			</c:otherwise>
		</c:choose>
        <div id="sod_fin_cancelfrm">
            <form method="post" action="/market/order/orderCancle" onsubmit="return fcancel_check(this);">
            <input type="hidden" name="order_idx"  value="${orderBaseInfo.order_idx}">
   
            <label for="cancel_memo">취소사유</label>
            <input type="text" name="cancel_memo" id="cancel_memo" required class="frm_input required" maxlength="100">
            <input type="submit" value="확인" class="btn_frmline">

            </form>
        </div>
     </section>
	
     
</div>

<script>
$(function() {
    $("#sod_sts_explan_open").on("click", function() {
        var $explan = $("#sod_sts_explan");
        if($explan.is(":animated"))
            return false;

        if($explan.is(":visible")) {
            $explan.slideUp(200);
            $("#sod_sts_explan_open").text("상태설명보기");
        } else {
            $explan.slideDown(200);
            $("#sod_sts_explan_open").text("상태설명닫기");
        }
    });

    $("#sod_sts_explan_close").on("click", function() {
        var $explan = $("#sod_sts_explan");
        if($explan.is(":animated"))
            return false;

        $explan.slideUp(200);
        $("#sod_sts_explan_open").text("상태설명보기");
    });
});

function fcancel_check(f)
{
    if(!confirm("주문을 정말 취소하시겠습니까?"))
        return false;

    var memo = f.cancel_memo.value;
    if(memo == "") {
        alert("취소사유를 입력해 주십시오.");
        return false;
    }

    return true;
}
</script>

    </div>
    
    <%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->
<%@ include file="/resources/market/include/marketFutter.jsp" %>

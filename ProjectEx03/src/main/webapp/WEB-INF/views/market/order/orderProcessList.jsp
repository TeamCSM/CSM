<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/market/include/marketHeader.jsp" %>


<div id="container">
    <div id="container_s">

    
	<h1 id="container_title">주문내역조회</h1>
<div id="sod_v">
    <p id="sod_v_info">주문서번호 링크를 누르시면 주문상세내역을 조회하실 수 있습니다.</p>

    


<div id="sod_inquiry">
    <ul>
        <c:forEach items="${orderBaseInfo}" var="orderBaseInfo">
        <li>
            <div class="inquiry_idtime">
                <a href="/market/order/orderRead?order_idx=${orderBaseInfo.order_idx}" class="idtime_link">${orderBaseInfo.order_idx}</a>
                <span class="idtime_time">${orderBaseInfo.order_regdate}</span>
            </div>
            <div class="inquiry_name">
                ${orderBaseInfo.item_names}            </div>
            <div class="inquiry_price">
                ${orderBaseInfo.item_totalPrice}            </div>
            <div class="inquiry_inv">
                <span class="inv_status">${orderBaseInfo.order_progress}</span>
                <span class="inv_inv"></span>
            </div>
        </li>
		</c:forEach>
        
        

        
        <!-- <li>
            <div class="inquiry_idtime">
                <a href="http://witch01.dothome.co.kr/0b/shop/orderinquiryview.php?od_id=2018022016584878&amp;uid=7582581111cdd6f90c1fe53117808e93" class="idtime_link">2018022016584878</a>
                <span class="idtime_time">18-02-20</span>
            </div>
            <div class="inquiry_name">
                상품 B1 상품 B1            </div>
            <div class="inquiry_price">
                0원            </div>
            <div class="inquiry_inv">
                <span class="inv_status">주문취소</span>
                <span class="inv_inv"></span>
            </div>
        </li> -->

            </ul>
</div>

    </div>

    </div>
    <%@ include file="/resources/market/include/quickMenu.jsp" %>

</div><!-- container End -->
<%@ include file="/resources/market/include/marketFutter.jsp" %>

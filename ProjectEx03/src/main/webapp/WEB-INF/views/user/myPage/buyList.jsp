<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<div id="container"><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">구매 리스트<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<section id="bo_list" class="container">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

 <div class="tbl_head01 tbl_wrap table-responsive">
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
				<td style="text-align:center;"><a href="/market/item/itemReadPage?item_idx=${buy.item_idx }">${buy.item_name }</a></td>
				<td style="text-align:center;">${buy.item_price }</td>
				<td style="text-align:center;">${buy.item_amount }</td>
				<td style="text-align:center;">${buy.item_sellerId }</td>
				<td style="text-align:center;">${buy.log_regdate }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</section>
</div>
<%@include file="/resources/include/footer.jsp" %>
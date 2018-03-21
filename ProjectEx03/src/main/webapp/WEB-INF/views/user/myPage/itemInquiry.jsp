<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<div id="container"><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">상품 문의<span class="sound_only"> 목록</span></span>
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
<script type="text/javascript">
$(document).ready(function() {

});
</script>
<div class="tbl_head01 tbl_wrap table-responsive">
	<table class="table table-hover">
	<thead class="thead-inverse">
		<tr>
			<th style="text-align:center;">제  목</th>
			<th style="text-align:center;">작성일</th>
		</tr>
	</thead>
		<c:forEach items="${inquiry }" var="inquiry">
			<tr>
				<td style="text-align:center;">${inquiry.inquiry_title }</td>
				<td style="text-align:center;">${inquiry.inquiry_regdate }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</section>
</div>
<%@include file="/resources/include/footer.jsp" %>
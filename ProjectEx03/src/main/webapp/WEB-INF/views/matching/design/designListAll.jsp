<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<div id="container"><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">디자이너 구하기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>

<!-- 게시판 목록 시작 { -->
<section id="bo_list" class="container">

    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->

    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div class="bo_fx">
		<form role="form">
			<button type="button" id="program" class="btn btn-sm btn-primary">프로그래머</button>
			<button type="button" id="design" class="btn btn-sm btn-primary">디자이너</button>
		</form>             
    </div>
    <!-- } 게시판 페이지 정보 및 버튼 끝 -->

    <div class="tbl_head01 tbl_wrap table-responsive">
        <table class="table table-hover">
        <caption>글 목록</caption>
        <thead class="thead-inverse">
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">글쓴이</th>
			<th>등록일</th>
			<th>조회수</th>
        </tr>
        </thead>
        <tbody id="list">
			<c:forEach items="${list}" var="designVO">

				<tr>
					<td style="text-align:center;">${designVO.idx}</td>
					<c:if test="${designVO.currentnum ne designVO.dmax and designVO.check_time eq '진행'}">
						<td><a href='/design/read?idx=${designVO.idx}' style="color:black;">[디자인] ${designVO.title} (${designVO.currentnum }/${designVO.dmax }) <span style="color:red;">남은일수 : ${designVO.max_time }</span></a></td>
					</c:if>
					<c:if test="${designVO.currentnum eq designVO.dmax or designVO.check_time eq '마감'}">
						<td><span style="text-decoration:line-through;">[디자인] ${designVO.title} (${designVO.currentnum }/${designVO.dmax })</span> <span style="color:red;">마감되었습니다.</span></td>
					</c:if>
					<td style="text-align:center;">${designVO.id}</td>
					<td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${designVO.regidate}" /></td>
					<td style="text-align:center;"><span class="badge bg-red">${designVO.viewcnt }</span></td>
				</tr>

			</c:forEach>
		</tbody>
        </table>
    </div>

        <div class="bo_fx">
        
                <ul class="btn_bo_user">
                        <li><a href="/program/register" class="btn btn-sm btn-primary">글쓰기</a></li>        </ul>
            </div>


<!-- 페이지 -->
<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

<div class="text-center">
	<ul class="pagination">

		<c:if test="${pageMaker.prev}">
			<li><a href="${pageMaker.startPage - 1 }">&laquo;</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
				<a href="${idx}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="${pageMaker.endPage + 1 }">&raquo;</a></li>
		</c:if>

	</ul>
</div>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	$(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/program/listAll").attr("method", "get");
		jobForm.submit();
	});
	
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$("#program").on("click", function() {
			formObj.attr("action", "/program/listAll");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#design").on("click", function() {
			formObj.attr("action", "/design/listAll");
			formObj.attr("method", "get");
			formObj.submit();
		});
	});
</script>

</section>
<!-- } 게시판 목록 끝 -->
</div>

<%@include file="/resources/include/footer.jsp" %>
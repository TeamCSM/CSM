<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<div id="container"><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">프로그래머<span class="sound_only"> 목록</span></span>
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

    <form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="sfl" value="">
    <input type="hidden" name="stx" value="">
    <input type="hidden" name="spt" value="">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sst" value="wr_num, wr_reply">
    <input type="hidden" name="sod" value="">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="sw" value="">

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
			<c:forEach items="${list}" var="programVO">

				<tr>
					<td style="text-align:center;">${programVO.idx}</td>
					<c:if test="${programVO.currentnum ne programVO.pmax and programVO.check_time eq '진행'}">
						<td><a href='/program/read?idx=${programVO.idx}'>[프로그램] ${programVO.title} (${programVO.currentnum }/${programVO.pmax }) <span style="color:red;">남은일수 : ${programVO.max_time }</span></a></td>
					</c:if>
					<c:if test="${programVO.currentnum eq programVO.pmax or programVO.check_time eq '마감'}">
						<td><span style="text-decoration:line-through;">[프로그램] ${programVO.title} (${programVO.currentnum }/${programVO.pmax })</span> <span style="color:red;">마감되었습니다.</span></td>
					</c:if>
					<td style="text-align:center;">${programVO.id}</td>
					<td style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${programVO.regidate}" /></td>
					<td style="text-align:center;"><span class="badge bg-red">${programVO.viewcnt }</span></td>
				</tr>

			</c:forEach>
		</tbody>
        </table>
    </div>

        <div class="bo_fx">
        
                <ul class="btn_bo_user">
                        <li><a href="/program/register" class="btn btn-sm btn-primary">글쓰기</a></li>        </ul>
            </div>
        </form>


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
<!-- 게시판 검색 시작 { -->
<fieldset id="bo_sch">
    <form name="fsearch" method="get" class="form-inline">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sop" value="and">
    <select name="sfl" id="sfl" class="form-control input-sm">
        <option value="wr_subject">제목</option>
        <option value="wr_content">내용</option>
        <option value="wr_subject||wr_content">제목+내용</option>
        <option value="mb_id,1">회원아이디</option>
        <option value="mb_id,0">회원아이디(코)</option>
        <option value="wr_name,1">글쓴이</option>
        <option value="wr_name,0">글쓴이(코)</option>
    </select>
    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
    <input type="text" name="stx" value="" required id="stx" class="form-control input-sm required" size="15" maxlength="20">
    <input type="submit" value="검색" class="btn btn-sm btn-success">
    </form>
</fieldset>
</section>
<!-- } 게시판 검색 끝 -->

<!-- } 게시판 목록 끝 -->
</div>

<%@include file="/resources/include/footer.jsp" %>
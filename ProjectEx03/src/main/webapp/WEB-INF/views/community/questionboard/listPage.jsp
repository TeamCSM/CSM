<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1"> --%>
<style>
img {
    margin-top: 0px;
}
</style>
<%@include file="/resources/include/header.jsp"%>

<div id="container"><section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">지식 In<span class="sound_only"> 목록</span></span>
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
        <div id="bo_list_total">
            <span>Total ${UnderPage.totalCount }건</span>
            ${UnderPage.pm.page} 페이지
        </div>

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
	
	<script>
	
		var result = '${msg}';
		
		if(result=='success'){
			alert("삭제가 완료되었습니다.");
		}
		else if(result=='modify'){
			alert("수정이 완료되었습니다.");
		}
	</script>
	
    <div class="tbl_head01 tbl_wrap table-responsive">
        <table class="table table-hover">
        <thead class="thead-inverse">
        <tr>
            <th style="width: 90px">번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th style="width: 40px">조회</th>
        </tr>
        </thead>
        <tbody>
       <c:choose>
		<c:when test="${not empty list2}">
		<c:forEach items="${list2}" var="NoticeVO">
		<tr align="center">
			<td>공지사항</td>
			<td><a href="/customer/sNotice/readPage?bno=${NoticeVO.notice_bno }" style="color: black;">
			${NoticeVO.notice_title}</a></td>
			<td>${NoticeVO.notice_writer}관리자</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${NoticeVO.notice_regidate}" /></td>
			<td style="width: 40px"><span class="badge bg-red">${NoticeVO.notice_viewcnt}</span></td>
		</tr>
		</c:forEach>
		</c:when>
		
		<c:otherwise>
		
		</c:otherwise>
		
		</c:choose>
		<c:forEach items="${list}" var="questionboardVO">
		<tr align="center">
			<td>${questionboardVO.rnum }</td>
			<td>
			<%-- <c:if test="${questionboardVO.indent > 0 }">
				<c:forEach begin="1" end="${questionboardVO.indent }">
					&nbsp;&nbsp;
				</c:forEach>
				<img src="../resources/img/icon_reply.gif">
			</c:if> --%>
			<a href="/community/questionboard/readPage${UnderPage.makeSearch(UnderPage.pm.page)}
			&bno=${questionboardVO.bno }&bgroup=${questionboardVO.bgroup}&writer=${questionboardVO.writer}" style="color: black;">
			(${questionboardVO.question})-${questionboardVO.title} <strong>[답변수:${questionboardVO.replycount}]</strong> <strong>[포인트:${questionboardVO.point}점]</strong></a></td>
			<td>${questionboardVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${questionboardVO.regdate}" /></td>
			<td style="width: 40px"><span class="badge bg-red">${questionboardVO.viewcount}</span></td>
		</tr>
		</c:forEach>
        </table>
  	</div>

        <div class="bo_fx">
        
                <ul class="btn_bo_user">
                        <li><a href="./register" class="btn btn-sm btn-primary">글쓰기</a></li>        </ul>
            </div>
        </form>


		<!-- 페이지 -->

		<div class="box-footer">

			<div class="text-center">
				<ul class="pagination">

					<c:if test="${UnderPage.prev}">
						<li><a
							href="listPage${UnderPage.makeSearch(UnderPage.startPage-1) }">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${UnderPage.startPage }"
						end="${UnderPage.endPage }" var="idx">
						<li
							<c:out value="${UnderPage.pm.page == idx?'class =active':''}"/>>
							<a href="listPage${UnderPage.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${UnderPage.next && UnderPage.endPage > 0}">
						<li><a
							href="listPage${UnderPage.makeSearch(UnderPage.endPage+1) }">&raquo;</a></li>
					</c:if>

				</ul>
			</div>
		</div>


<!-- 게시판 검색 시작 { -->

<fieldset id="bo_sch">
    <form class="form-inline">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sop" value="and">
    <select name="searchType"class="form-control input-sm">
       <div class='box-body'>
		<option value="null"
			<c:out value="${pm.searchType == null ? 'selected' : ''}"/>>
					---</option>
		<option value="title"
			<c:out value="${pm.searchType eq '제목' ? 'selected' : ''}"/>>
					제목</option>
		<option value="content"
			<c:out value="${pm.searchType eq '내용' ? 'selected' : ''}"/>>
					내용</option>
		<option value="writer"
			<c:out value="${pm.searchType eq '작성자' ? 'selected' : ''}"/>>
					작성자</option>
		</div>
    </select>
    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
    <input type="text" name="keyword" value="${pm.keyword }" required id="keywordInput" class="form-control input-sm required" size="15" maxlength="20">
    <input type="button" id='searchBtn' value="검색" class="btn btn-sm btn-success">
    </form>
    
    <script>	
		$(document).ready(function(){
			$("#searchBtn").on("click",function(event){
				var keyword = $(".keyword").val();
				if(keyword==null){
					alert("검색란에 입력하세요");
				}
				else{
					self.location = "listPage"
						+ "${UnderPage.makeQuery(1)}"
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				}
				
			});
						
		});
	</script>
</fieldset>
</section>
<!-- } 게시판 검색 끝 -->

<!-- } 게시판 목록 끝 -->
</div>
<%@include file="/resources/include/footer.jsp"%>
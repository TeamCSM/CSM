<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp" %>
<script src="/resources/customer/js/moment.js"></script>
<div id="container">
<section class="success" id="header">
    <div class="container">
        <div class="intro-text">
            <span class="name wow fadeInDown" data-wow-delay=".5s">1:1문의하기<span class="sound_only"> 목록</span></span>
            <hr class="star-light wow zoomIn">
            <span class="skills wow fadeInUp" data-wow-delay="1s"></span>
        </div>
    </div>
</section>
<style>
#bo_list .tbl_head01 a {
    text-decoration: none;
    color: #232327;
}
</style>
<script>
	var result = "${msg}";
	
	if(result == "SUCCESS"){
		alert("처리가 완료되었습니다");
	}
	var realSearch = function(){
		$.ajax({
			url : "../sContact/listSearch",
			dataType : "json",
			type : "get", 
			contentType : "text/html; charset:utf-8",
			data : {
				searchType : $("select option:selected").val(),
				keyword : $('#keywordInput').val()
			},
			success : function(d){
				d.list.regidate = moment().format("YYYY-MM-DD HH:mm");
				var regidate = d.list.regidate;
				var contents = "";
				contents +="<div class='tbl_head01 tbl_wrap table-responsive'>";
				contents +="<table class='table table-hover'>";
				contents +="<caption>글 목록</caption>";
				contents +="<thead class='thead-inverse'>";
				contents +="<tr>";
				contents +="<th scope='col'>번호</th>";
				contents +="<th scope='col'>제목</th>";
				contents +="<th scope='col'>글쓴이</th>";
				contents +="<th>등록일</th>";
				contents +="<th>조회수</th>";
				contents +="</tr>";
				contents +="</thead>";
				contents +=	"<tbody id='list'>";
				 $.each(d.list, function(index, ContactVO){
					contents +="<tr>";
					contents +="<td>"+ContactVO.contact_bno+"</td>";
					contents +="<td><a href='../sContact/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno='"+ContactVO.contact_bno+"'>"+ContactVO.contact_title+"</a></td>";
					contents +="<td>"+ContactVO.contact_writer+"</td>";
					contents +="<td>"+regidate+"</td>";
					contents +="<td><span class='badge bg-red'>"+ContactVO.contact_viewcnt+"</span></td>";
					contents +="</tr>";	
					
				}); 
				 	contents +="</tbody>";
					contents +="</table>";
					contents +="</div>";
				$("#searchBoard").html(contents);
			},
			error : function(e){//실패시 오류 페이지 띄워주기0
				alert("오류발생:"+e.status	+" "+e.statusText);
			}
		});
	}
</script>

<!-- 게시판 목록 시작 { -->
<section id="bo_list" class="container">

    <!-- 게시판 카테고리 시작 { -->
        <!-- } 게시판 카테고리 끝 -->

    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
 
<div id="searchBoard">
    <div class="tbl_head01 tbl_wrap table-responsive" >
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
			
			<c:forEach items="${list}" var="ContactVO">
				<tr>
					<td>${ContactVO.contact_bno}</td>
					<td><a href='../sContact/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${ContactVO.contact_bno}'>${ContactVO.contact_title}</a></td>
					<td>${ContactVO.contact_writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${ContactVO.contact_regidate}" /></td>
					<td><span class="badge bg-red">${ContactVO.contact_viewcnt}</span></td>
				</tr>
			</c:forEach>
		</tbody>
        </table>
    </div>
</div>
          <!-- <ul class="btn_bo_user">
                  <li><a href="/customer/sContact/register" class="btn btn-sm btn-primary">글쓰기</a></li>  
		  </ul> -->
        </form>

<!-- 페이지 -->
<form id="jobForm">
	<input type='hidden' name="page" value="${pageMaker.cri.perPageNum}">
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form>

<div class="text-center">
		<ul class="pagination">
			
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
<fieldset id="bo_sch">
    <form class="form-inline">
    <input type="hidden" name="bo_table" value="notice">
    <input type="hidden" name="sca" value="">
    <input type="hidden" name="sop" value="and">
<div class='box-body' style="text-align: center;">
					<select name="searchType" class="form-control input-sm">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							작성자</option>
					</select>
	<input type="text" name='keyword' id="keywordInput" class="form-control input-sm required" size="15" maxlength="20"
			value='${cri.keyword }' onkeyup="realSearch();">
	<button id='searchBtn' class="btn btn-sm btn-success">검색</button>
	</form>
<script>
var result = '${msg}';

if (result == 'SUCCESS') {
	alert("처리가 완료되었습니다.");
}
$(document).ready(
	function() {
		$('#searchBtn').on("click",function(event) {
			self.location = "list"
		+ '${pageMaker.makeQuery(1)}'
		+ "&searchType="
		+ $("select option:selected").val()
		+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
		$('#newBtn').on("click", function(evt) {
			self.location = "register";
		});
	});
</script>
</body>
</fieldset>
</section>
</div>
<script>
function doPopupopen(){
	url = "../message/Massage";
	name = "_blank";  
	specs = "width=800, height=600, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no"; 
	window.open(url,name,specs);
}
</script>
<%@include file="/resources/include/footer.jsp" %>
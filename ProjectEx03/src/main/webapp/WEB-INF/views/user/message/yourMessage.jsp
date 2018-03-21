<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/customer/css/main.css" />
<html>
<script>
$(document).ready(function(){
	$(".yourMessage").click(function(event){
		
		event.preventDefault();
		var move = $(this).attr('href');
		
		$.ajax({
			url : move,
			type : "get",
			dataType : "html",
			success : function(data){
				$("#messageAjax").html(data);		
			}
		});
	});
});
</script>
<head>
	<title>쪽지</title>
</head>
<body>
<div class="container" style="max-width: 45em;">
<h4><span style="color: red;">${login.user_name }</span>님 환영합니다</h4>
<h4>받은 쪽지함</h4>

<table class="table table-hover">
       <caption>내가 받은 쪽지</caption>
      <thead class="thead-inverse">
      <tr>
      	  <th scope="col">상태</th>
    	  <th scope="col">제목</th>
          <th scope="col">내용</th>
		  <th>날짜</th>
      </tr>
      </thead>
      <tbody id="list">
	
	<c:forEach items="${yourMessage}" var="messageVO">
			<tr>
			<td style="width: 50px;">
				<c:if test="${messageVO.receiverChecks!=0}">
					<i class="fa fa-envelope-open"></i>
				</c:if>
				<c:if test="${messageVO.receiverChecks==0}">
					<i class="fa fa-envelope"></i>
				</c:if>
			</td>
			<td><a href='../message/readPage?messagenum=${messageVO.messagenum}&type=receive' class="yourMessage">${messageVO.title}</a></td>
			<%-- <td><a href='../sBestm/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${BestQVO.bestq_bno}'>${BestMVO.bestm_title}</a></td> --%>
			<td>${messageVO.content }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${messageVO.regidate}" /></td>
			</tr>
	</c:forEach>
</tbody>
      </table>
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
</div>
<script type="text/javascript">
var result = '${msg}';

if (result == 'SUCCESS') {
	alert("처리가 완료되었습니다.");
}
else if(result == "FAIL") {
	alert("회원 정보가 없습니다.");
	self.location = "register";
}

</script>
</body>
</html>
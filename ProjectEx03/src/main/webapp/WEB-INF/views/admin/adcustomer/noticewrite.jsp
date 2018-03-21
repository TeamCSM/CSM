<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 작성</title>

<script>
	$(document).ready(function() {

		$("#btnList").click(function() {
			document.form1.action = "/admin/adcustomer/adcuBoardAlllist";
			document.form1.submit();

		});

		$("#btnSave").click(function() {
	
			var title = $("#notice_title").val();
			var content = $("#notice_content").val();
			if (notice_title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (notice_content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.action = "/admin/adcustomer/noticeregister"
			document.form1.submit();
		});
	});
</script>


</head>
<body>

	<%-- <%@include file="../include/header.jsp"%> --%>
	<br>
	<h2>공지사항 게시글 작성</h2>
	<form id="form1" name="form1" method="post"
		action="/admin/adcustomer/noticeregister">
		<input type="hidden" id="admin_number" name="admin_number"
			value="${ sessionScope.avo.admin_number}">
		<div>
			제목 <input name="notice_title" id="notice_title" size="80"
				placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="notice_content" id="notice_content" rows="4"
				cols="80" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
			이름 <input name="notice_writer" id="notice_writer" readonly="readonly"
				value="${login.user_name }">
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset" id="btnList">취소</button>
		</div>
	</form>

</body>
</html>
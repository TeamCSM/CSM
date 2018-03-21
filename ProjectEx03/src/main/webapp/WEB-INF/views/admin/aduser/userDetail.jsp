<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(function(){
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/admin/aduser/adminuserdelete";
			document.form1.submit();
		}
	});
	$("#btnchangeSeller").click(function(){
		if(confirm("판매자 권한을 주시겠습니까?")){
			document.form1.action="${path}/admin/aduser/adminuserchangeSeller";
			document.form1.submit();
		}
	});
	
	
	
		$("#btnlist").click(function(){
			location.href = "/admin/aduser/userlist";				 
		});
		
		
});		
</script>

<!-- <link rel="stylesheet" href="/admin/resources/css/style.css"> -->
</head>
<body>
	
	<br>

	<div align="center">
		<form name="form1">
		<h2>회원 정보 상세보기</h2>
		
			<br>
			<table border="1">

					<tr>
						<th>user_id</th>
						<th>user_name</th>
						<th>user_gender</th>
						<th>user_birthday</th>
						<th>user_email</th>
						<th>user_phone</th>
						<th>user_mailNumber</th>
						<th>user_streetAddr</th>
						<th>user_detailedAddr</th>
						<th>user_termsService</th>
						<th>user_termsPrivacy </th>
						<th>user_termsLocation </th>
						<th>user_termsEmail </th>
						<th>user_regdate </th>
						<th>user_authority </th>
						<th>user_point </th>
					</tr>
				<tr align="center">
					<%-- 
					<td>
						<input type="hidden" name="user_number" value="${userDetail.user_number }" readonly="readonly">
					    <input type="hidden" name="user_status" value="${userDetail.user_status }">${userDetail.user_number }
					</td> 
					--%>
					<input type="hidden" name="user_id" value="${userDetail.user_id }"/>
					<td>${userDetail.user_id }</td>
					<td>${userDetail.user_name }</td>
					<td>${userDetail.user_gender }</td>
					<td>${userDetail.user_birthday }</td>
					<td>${userDetail.user_email }</td>
					<td>${userDetail.user_phone }</td>
					<td>${userDetail.user_mailNumber }</td>
					<td>${userDetail.user_streetAddr }</td>
					<td>${userDetail.user_detailedAddr }</td>
					<td>${userDetail.user_termsService }</td>
					<td>${userDetail.user_termsPrivacy } </td>
					<td>${userDetail.user_termsLocation } </td>
					<td>${userDetail.user_termsEmail } </td>
					<td>${userDetail.user_regdate } </td>
					<td>${userDetail.user_authority } </td>
					<td>${userDetail.user_point}</td>
				</tr>
				<tr>
					<td colspan="16" align="center">
						<input type="button"  id="btnDelete" value="삭제">
						<input type="button"  id="btnchangeSeller" value="판매자 권한주기">
						<input type="button"  id="btnlist" value="리스트로">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>